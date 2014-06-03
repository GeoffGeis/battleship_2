class Ship
  attr_accessor :row, :col, :orientation, :size

  def initialize(b)
    @row = Random.rand(1..b.board.length)
    @col = Random.rand(1..b.board[0].length)
    @orientation = ["up", "side"].sample
    @size = Random.rand(1..5)
  end
end