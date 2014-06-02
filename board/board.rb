class Board
  def initialize
    @size = 0
  end

  def get_user_input
    @size = gets.chomp.to_i
  end

  def print_board
    board = (1..@size).map { |x| ["O"] * @size }
    board.map { |row| puts row.join }
  end
end