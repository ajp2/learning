require "hand.rb"

describe Hand do
  describe "#initialize" do
      let(:card) { double("Card", :number => 5, :suit => "H", :value => "5H") }
      subject(:hand) { Hand.new([card] * 5) }

      it "creates an array of length 5" do
        expect(hand.cards.length).to eq(5)
      end
  end

  describe "hand strength" do
    describe "#straight_flush" do
      let(:cards) do
        arr = []
        (2..5).each do |n|
          arr << double("Card", :number => n, :suit => "C", :value => n.to_s + "C")
        end
        arr
      end

      it "returns false if cards are not in same suit" do
        hand = Hand.new(cards << double("Card", :number => 6, :suit => "H", :value => "6H"))
        expect(hand.straight_flush).to eq(false)
      end

      it "returns false if cards do not increment by one" do
        hand = Hand.new(cards << double("Card", :number => 10, :suit => "C", :value => "10C"))
        expect(hand.straight_flush).to eq(false)
      end

      it "returns true if straight flush" do
        hand = Hand.new(cards << double("Card", :number => 6, :suit => "C", :value => "6C"))
        expect(hand.straight_flush).to eq(true)
      end
    end

    describe "#four_of_a_kind" do
      it "returns true if 4 cards of the same suit"
      it "returns false if less than 4 cards of same suit"
    end
  end
end


# variables vs let??