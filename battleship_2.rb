require './board/board.rb'
require './ship/ship.rb'

class Battleship
  attr_accessor :board, :proxi, :ship_count, :ships

  def initialize
    puts "Let's play Battleship!"
    puts "Pick an ocean size:" 
    @board = Board.new
    @proxi = Board.new(@board.size)
    puts "Pick the number of ships:"
    @ship_count = gets.chomp.to_i
    @ships = (1..@ship_count).map { |i| i = Ship.new(@board) }
    puts_ships
    game
  end

  def puts_ships
    @ships.each do |i|
      if i.orientation == "up"
        (1..i.size).each { |x| @proxi.board[i.row - x][i.col - 1] = "|" }
      else
        (1..i.size).each { |x| @proxi.board[i.row - 1][i.col - x] = "-" }    
      end
    end
  end

  def game
    turns = @board.size + @board.size
    turns += @ship_count
    while turns > 0 
      @board.print_board
      puts "===== Turn #{turns.to_s} ====="
      puts "Guess Row:" 
      guess_row = gets.chomp.to_i - 1 
      puts "Guess Col:"
      guess_col = gets.chomp.to_i - 1 
      if (guess_row < 0 || guess_row > @board.size - 1) || (guess_col < 0 || guess_col > @board.size - 1)
        puts "Oops, that's not even in the ocean."
      elsif ["|", "-", " "].include?(@board.board[guess_row][guess_col])
        puts "You guessed that one already."
      elsif ["|", "-"].include?(@proxi.board[guess_row][guess_col])
        puts "Congratulations! Hit!"
        @board.board[guess_row][guess_col] = @proxi.board[guess_row][guess_col]
        if @board.board == @proxi.board
          break
        end
      else
        puts "You missed my battleship!"
        @board.board[guess_row][guess_col] = " "
        @proxi.board[guess_row][guess_col] = " "
        turns -= 1
      end
    end
    if @board.board == @proxi.board
      @board.print_board
      puts "You won!"
      another_game
    else
      @proxi.print_board
      puts "You lost!"
      another_game
    end
  end

  def another_game
    puts "Play again? (y/n)"
    again = gets.chomp.to_s.downcase
    if again == "y"
      initialize
    elsif again == "n"
      puts "Thanks for playing, see you next time captain!"
      exit
    else
      puts "Please make a correct selection of (y/n)"
      another_game
    end 
  end
end

b = Battleship.new