$LOAD_PATH.unshift(Dir.pwd) unless $LOAD_PATH.include?(Dir.pwd)

require 'alpha/constants.rb'
require 'alpha/utils.rb'
require 'alpha/search.rb'

module Alpha
  def self.search(options = {})
    Search.new(options).run
  end

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
