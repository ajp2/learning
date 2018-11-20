class Tile
  attr_reader :bombed, :revealed, :flagged

  def initialize(pos, bombed = false)
    @pos = pos
    @bombed = bombed
    @flagged = false
    @revealed = false
  end

  def reveal
    @revealed = true if !@flagged
  end

  def flag
    @flagged = !@flagged
  end

  def inspect
    [@pos, @flagged, @bombed]
  end
end


# a = Tile.new([1, 1], [[0,1,2,3,4,5,6,7,8], [0,1,2,3,4,5,6,7,8], [0,1,2,3,4,5,6,7,8]])
# p a