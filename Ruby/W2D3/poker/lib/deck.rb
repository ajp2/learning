require_relative "card.rb"

class Deck
  attr_accessor :card_deck

  SUITS = ["S", "H", "D", "C"]

  def initialize
    @card_deck = populate
    @card_deck.shuffle!
  end

  def shuffle!
    @card_deck = @card_deck.shuffle
  end

  protected
  def populate
    cards = []

    SUITS.each do |suit|
      (2..14).each do |num|
        cards << Card.new(num, suit)
      end
    end

    cards
  end
end

# d = Deck.new
# p d.card_deck