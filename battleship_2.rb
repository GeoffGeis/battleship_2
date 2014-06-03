require './board/board.rb'
require './ship/ship.rb'

class Battleship
  attr_accessor :board, :proxi, :ship_count, :ships

  def initialize 
    @board = Board.new
    @proxi = Board.new(@board.size)
    @ship_count = gets.chomp.to_i
    @ships = (1..@ship_count).map { |i| i = Ship.new(@board) }
    puts_ships
  end

  def puts_ships
    @ships.each do |i|
      if i.orientation == "up"
        (1..i.size).each { |x| @proxi.board[i.row - x][i.col - 1] = "X" }
      else
        (1..i.size).each { |x| @proxi.board[i.row - 1][i.col - x] = "X" }    
      end
    end
  end
end