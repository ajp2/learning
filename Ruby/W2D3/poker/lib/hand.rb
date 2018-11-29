require_relative "card.rb"

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def straight_flush
    nums = cards.map { |card| card.number }
    suits = cards.map { |card| card.suit }

    return false if suits.count(suits[0]) != 5
    (0...nums.length - 1).each do |n|
      return false if (nums[n] - nums[n + 1]).abs != 1
    end

    true
  end
end



# cards = [
#   Card.new(2, "H"),
#   Card.new(3, "H"),
#   Card.new(4, "H"),
#   Card.new(5, "H"),
#   Card.new(6, "H")
# ]

# h = Hand.new(cards)
# p h.straight_flush