$LOAD_PATH.unshift(Dir.pwd) unless $LOAD_PATH.include?(Dir.pwd)

require 'alpha/constants.rb'
require 'alpha/utils.rb'
require 'alpha/search.rb'

module Alpha
  
  # Creates a search instance from the given options, executes the search, and returns
  # a serializable result. Accepts optional arguments for :fen, and :height
  def self.search(options = {})
    Search.new(options).run
  end

  # For tinkering; engine plays against itself for a given number of turns. Accepts optional
  # arguments for :fen, :height, and :turns
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
