require './board/board.rb'
require './ship/ship.rb'

class Battleship
  attr_accessor :debug

  def initialize 
    @debug = true
    @board = Board.new
    @ship = Ship.new
    game
  end
end
