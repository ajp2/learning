class Card
  attr_reader :number, :suit, :value

  def initialize(number, suit)
    @number = number
    @suit = suit
    @value = @number.to_s + @suit
  end

  def to_s
    @value
  end
end