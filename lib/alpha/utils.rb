module Alpha
  module Utils
    def ascii(i)
      ASCII[@colors[i] % 6][@pieces[i]]
    end

    def utf8(i)
      UTF8[@colors[i] % 6][@pieces[i]]
    end

    def board
      "\n " + ROWS.map { |r| r.map { |i| utf8(i) }.join(' ') }.join("\n ")
    end

    def print_board
      print board
    end

    def piece_list
      (0..1).map { |color| SQ.select { |i| @colors[i] == color }.map { |i|
          { piece: PIECES[color], square: i } } }
    end

    def generate_fen
      ROWS.map { |r| r.map { |i| ascii(i) }.join.gsub(/_+/, &:length) }.
        join('/') + " #{COLORS[@mx]} - - 0 #{@turn}"
    end

    # parse a given fen string, default: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
    def parse_position(fen)
      chunks  = (fen || FEN_INITIAL).split
      squares = chunks[0].gsub(/[1-8]/) { |s| '_' * s.to_i }.delete('/').chars
      @colors = squares.map { |s| s == '_' ? EMPTY : s == s.upcase ? WHITE : BLACK }
      @pieces = squares.map { |s| ASCII[0].index(s.upcase) }
      @kings  = [squares.index('K'), squares.index('k')]
      @turn   = chunks[5].to_i
      @mx     = chunks[1] == 'b' ? BLACK : WHITE
      @mn     = @mx ^ 1
    end
  end
end
