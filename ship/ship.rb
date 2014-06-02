class Ship
  attr_accessor :row, :col, :orientation, :size

  def initialize(b)
    @row = Random.rand(0..b.board.length - 1)
    @col = Random.rand(0..b.board[0].length - 1)
    @orientation = ["up", "side"].sample
    @size = Random.rand(1..5)
  end
end