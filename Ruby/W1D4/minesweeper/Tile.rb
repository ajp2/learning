class Tile
  attr_reader :bombed, :revealed, :flagged, :pos
  attr_accessor :value

  def initialize(pos, bombed = false)
    @pos = pos
    @bombed = bombed
    @flagged = false
    @revealed = false
    @value = nil
  end

  def reveal
    @revealed = true if !@flagged
  end

  def flag
    @flagged = !@flagged
  end
end