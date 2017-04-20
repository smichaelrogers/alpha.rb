$LOAD_PATH.unshift(Dir.pwd) unless $LOAD_PATH.include?(Dir.pwd)

require 'alpha/constants.rb'
require 'alpha/utils.rb'
require 'alpha/search.rb'

module Alpha
  # Creates a new search instance from the given options, executes the search, and returns
  # a serializable result.
  #
  # @example
  #   Alpha.search(fen: 'rnbqkb1r/ppp2ppp/8/3p4/3Pn3/3B1N2/PPP2PPP/RNBQK2R b KQkq - 0 6', height: 4
  #     ).serialize => {:fen=>"...", :nodes=>3718, :clock=>0.32, :nps=>11474, :board=>"...", :move=>{:from=>"b8", :to=>"c6", :piece=>"n", :target=>"_"}}
  #
  # @param options [Hash] Optional configuration (:fen, :height)
  # @return [Alpha::Result, nil] Serializable result obj; failed search returns nil
  def self.search(options = {})
    Search.new(options).run
  end

  # For tinkering; engine plays against itself for a given number of turns. Accepts a :turns
  # option as well as the other parameters accepted by #search
  #
  # @example
  #   Alpha.autoplay(turns: 3, height: 4) =>
  #
  # @param options [Hash] Optional configuration (:fen, :height, :turns)
  # @return [Alpha::Result]
  def self.autoplay(options = {})
    game = [options.fetch(:fen, FEN_INITIAL)]
    (options[:turns] || 10).times do
      result = Search.new(options.merge({ fen: game.last })).run
      return unless result
      puts result.board
      game << result.fen
    end
  end
end
