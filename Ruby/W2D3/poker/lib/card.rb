class Card
  attr_reader :number, :suit, :value

  NUMS = (2..13).to_a
  SUITS = ["S", "H", "D", "C"]

  def initialize(number, suit)
    raise(ArgumentError, "Number and suit are invalid") if (number < 2 || number > 14) &&
    !SUITS.include?(suit)
    raise(ArgumentError, "Number is invalid") if number < 2 || number > 14
    raise(ArgumentError, "Suit is invalid") if !SUITS.include?(suit)
    
    @number = number
    @suit = suit
    @value = @number.to_s + @suit
  end

  def to_s
    @value
  end
end