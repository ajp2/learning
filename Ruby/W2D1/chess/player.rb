class Player
  attr_reader :color

  def initialize(color, display)
    @color = color
    @display = display
  end
end

class HumanPlayer < Player
  def make_move
    input = @display.cursor.get_input
  end
end