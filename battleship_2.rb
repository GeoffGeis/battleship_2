require './board/board.rb'
require './ship/ship.rb'

class Battleship
  attr_accessor :board, :ship_count, :ships

  def initialize 
    @board = Board.new
    @ship_count = gets.chomp.to_i
    @ships = (1..@ship_count).map { |i| i = Ship.new(@board) }
  end

  def puts_ships
    @ships.each do |i|
      if i.orientation == "up"
        (1..i.size).each { |x| @board.board[i.row - x][i.col - 1] = "X" }
      else
        (1..i.size).each { |x| @board.board[i.row - 1][i.col - x] = "X" }    
      end
    end
  end
end