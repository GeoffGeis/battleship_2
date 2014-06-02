class Ship
  attr_accessor :orientation, :size, :row, :col

  def initialize(board)
    @orientation = ["up", "side"].sample
    @size = Random.rand(1..5 - 1)
    @row = Random.rand(0..board.board.length - 1)
    @col = Random.rand(0..board.board[0].length - 1)
  end
end