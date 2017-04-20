module Alpha
  class Search
    # Represents an instance of a chess engine search from a given position and configuration

    include Utils
    # Create a search instance with a given configuration
    def initialize(options = {})
      @fen    = options.fetch(:fen, FEN_INITIAL)
      @height = options.fetch(:height, 6)
      @moves  = Array.new(MAXPLY)
      parse_position(@fen)
    end

    # Execute search; returns a serializable result object
    def run
      @ply    = 0
      @nodes  = 0
      @root   = nil
      start_time = Time.now
      search(-INF, INF, @height)
      return unless @root
      make_move(@root)
      Result.new(generate_fen, @root, @nodes, Time.now - start_time, board)
    end

    # Recursive search function responsible for traversing a move tree and storing the best
    # move @ ply = 0 (root). Driven by a highly simplified minimax algorithm
    # optimizeed by Alpha-beta pruning.
    def search(alpha, beta, depth)
      return evaluate if depth == 0
      @nodes += 1
      generate_moves do |m|
        next unless make_move(m)
        x = -search(-beta, -alpha, depth - 1)
        unmake_move(m)
        if x > alpha
          return beta if x >= beta
          alpha = x
          @root = m if @ply == 0
        end
      end
      alpha
    end

    # Generates move objects from the vectors collected by #each_move; caches moves in @moves
    # indexed by their respective ply to prevent memory leaks (one move array per ply)
    def generate_moves
      @moves[@ply] = [].tap { |a| each_move { |f, t|
        a << Move.new(f, t, @pieces[f], @pieces[t]).freeze } }.each { |m| yield(m) }
    end

    # Returns an enumerator of all pseudolegal move vectors on the current ply
    def each_move
      SQ.select { |i| @colors[i] == @mx }.each do |f|
        if @pieces[f] == PAWN
          t = f + UP[@mx]
          yield(f, t + 1) if @colors[t + 1] == @mn && SQ120[SQ64[t] + 1] != NULL
          yield(f, t - 1) if @colors[t - 1] == @mn && SQ120[SQ64[t] - 1] != NULL
          next unless @colors[t] == EMPTY
          yield(f, t)
          yield(f, t + UP[@mx]) if @colors[t + UP[@mx]] == EMPTY && (f >> 3) == (SIDE[@mx] - 1).abs
          next
        end
        STEPS[@pieces[f]].each do |s|
          t = SQ120[SQ64[f] + s]
          while t != NULL
            yield(f, t) if @colors[t] != @mx
            break if @pieces[f] == KING || @pieces[f] == KNIGHT || @colors[t] != EMPTY
            t = SQ120[SQ64[t] + s]
          end
        end
      end
    end

    # Attemps a pseudolegal move; if the move causes self-check it is unmade. Handles pawn
    # promotions and king movement.
    def make_move(m)
      @ply += 1
      @colors[m.to], @pieces[m.to] = @mx, m.piece
      @colors[m.from], @pieces[m.from] = EMPTY, EMPTY
      @kings[@mx] = m.to if m.piece == KING
      @pieces[m.to] = QUEEN if m.piece == PAWN && (m.to >> 3) == SIDE[@mn]
      if in_check?
        @mx, @mn = @mn, @mx
        unmake_move(m)
        return false
      end
      @mx, @mn = @mn, @mx
      true
    end

    # Unmakes a move, handles king movement, uncapturing pieces, and demoting promoted pawns.
    def unmake_move(m)
      @ply -= 1
      @mx, @mn = @mn, @mx
      @colors[m.from], @pieces[m.from] = @mx, m.piece
      @colors[m.to], @pieces[m.to] = m.target == EMPTY ? EMPTY : @mn, m.target
      @kings[@mx] = m.from if m.piece == KING
    end

    # Basic evaluation function; returns a value relative to the side to move based on
    # the difference in sum of positioning and material values
    def evaluate
      SQ.inject { |x, n| x + (@colors[n] == @mx ?  (PST[n] + VALUE[@pieces[n]]) :
                              @colors[n] == @mn ? -(PST[n] + VALUE[@pieces[n]]) : 0) }
    end

    # Follows every valid move path outwards from the position of the king until finding an
    # obstruction or a potentially attacking piece. Immediately returns true upon finding
    # a valid attacker.
    def in_check?
      f = @kings[@mx]
      8.times do |i|
        t = SQ120[SQ64[f] + STEPS[KNIGHT][i]]
        return true if @pieces[t] == KNIGHT && t != NULL && @colors[t] == @mn
        s = STEPS[KING][i]
        t = SQ120[SQ64[f] + s]
        t = SQ120[SQ64[t] + s] while (t != NULL && @colors[t] == EMPTY)
        next if t == NULL || @colors[t] != @mn
        case @pieces[t]
        when QUEEN  then return true
        when BISHOP then return true if i < 4
        when ROOK   then return true if i > 3
        when PAWN   then return true if (s - UP[@mn]).abs == 1
        when KING   then return true if SQ120[SQ64[f] + s] == t
        end
      end
      false
    end
  end
end
