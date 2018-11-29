require_relative "card.rb"

class Hand
  attr_reader :cards, :nums, :suits

  def initialize(cards)
    @cards = cards
    @nums = @cards.map { |card| card.number }
    @suits = @cards.map { |card| card.suit }
  end

  def strength
    return 8 if straight_flush
    return 7 if four_of_a_kind
    return 6 if full_house
    return 5 if flush
    return 4 if straight
    return 3 if three_of_a_kind
    return 2 if two_pair
    return 1 if one_pair

    high_card
  end

  def straight_flush
    return false if @suits.count(@suits[0]) != 5
    (0...@nums.length - 1).each do |n|
      return false if (@nums[n] - @nums[n + 1]).abs != 1
    end

    true
  end

  def four_of_a_kind
    2.times do |n|
      return true if @nums.count(@nums[n]) == 4
    end
    
    false
  end

  def full_house
    three_of_a_kind && one_pair
  end

  def flush
    @suits.count(@suits[0]) == 5
  end

  def straight
    (0...@nums.length - 1).each do |n|
      return false if (@nums[n] - @nums[n + 1]).abs != 1
    end

    true
  end

  def three_of_a_kind
    3.times do |n|
      return true if @nums.count(@nums[n]) == 3
    end

    false
  end

  def two_pair
    pairs = []
    4.times do |n|
      pairs << @nums[n] if @nums.count(@nums[n]) == 2 &&
        !pairs.include?(@nums[n])
    end

    return true if pairs.length == 2
    false
  end

  def one_pair
    4.times do |n|
      return true if @nums.count(@nums[n]) == 2
    end

    false
  end

  def high_card
    ("0." + @nums.max.to_s).to_f
  end
end



# cards = [
#   Card.new(2, "H"),
#   Card.new(2, "H"),
#   Card.new(2, "S"),
#   Card.new(6, "H"),
#   Card.new(5, "H")
# ]

# h = Hand.new(cards)
# p h.full_house