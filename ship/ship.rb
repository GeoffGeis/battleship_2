class Ship
  attr_accessor :orientation, :size

  def initialize
    @orientation = ["up", "side"].sample
    @size = Random.rand(1..5 - 1)
  end
end