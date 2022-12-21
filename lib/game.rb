#rubocop :disable all
require_relative "board"
require 'colorize'

class Game
    attr_accessor :game_board
    def initialize
        @game_board = Board.new
    end
end

game =Game.new

rook = game.game_board.find_piece(0,0)

white_bishop = game.game_board.find_piece(2,0)
white_bishop.position = [2,5]
white_bishop.move?(game.game_board,3,6)
white_bishop.take?(game.game_board,3,6)




puts game.game_board.display
