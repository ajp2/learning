require "rspec"
require "deck.rb"

describe Deck do
  subject(:deck) { Deck.new }
  let(:suits) { ["S", "H", "D", "C"] }
  let(:nums) { (2..14).to_a }

  describe "#initialize" do
    it "creates an array of length 52" do
      expect(deck.card_deck.length).to eq(52)
    end

    it "does not have any duplicate cards" do
      deck.card_deck.each do |card|
        expect(deck.card_deck.count(card)).to eq(1)
      end
    end

    it "has 13 cards of each suit" do
      suits.each do |suit|
        cards_in_suit = deck.card_deck.select { |card| card.suit == suit }
        expect(cards_in_suit.length).to eq(13)
      end
    end

    it "has cards numbered 1 through 13 for each suit" do
      suits.each do |suit|
        cards_in_suit = deck.card_deck.select { |card| card.suit == suit }
        card_nums = cards_in_suit.map { |card| card.number }
        expect(card_nums.sort).to eq(nums)
      end
    end
  end

  describe "#shuffle!" do
    it "changes the order of the elements" do
      unshuffled = deck.card_deck.dup
      expect(deck.card_deck).to eq(unshuffled)
      deck.shuffle!
      expect(deck.card_deck).not_to eq(unshuffled)
    end
    
  end
end