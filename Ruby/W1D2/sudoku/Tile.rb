require "colorize"

class Tile
  def initialize(value, given = false)
    @value = value
    @given = given
  end

  def to_s
    @given ? @value.colorize(:blue) : @value.colorize(:red)
  end
end