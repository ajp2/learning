require "colorize"

class Tile
  def initialize(value, given = false)
    @value = value
    @given = given
  end

  def to_s
    return " " if @value == 0
    @given ? @value.to_s.colorize(:blue) : @value.to_s.colorize(:red)
  end
end