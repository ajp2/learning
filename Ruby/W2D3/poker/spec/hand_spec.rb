require "rspec"
require "hand.rb"

describe Hand do
  describe "#initialize" do
      let(:card) { double("Card", :number => 5, :suit => "H", :value => "5H") }
      subject(:hand) { Hand.new([card] * 5) }

      it "creates an array of length 5" do
        expect(hand.cards.length).to eq(5)
      end
  end

  describe "#strength" do
    let(:cards) do
      arr = []
      (2..5).each do |n|
        arr << double("Card", :number => n, :suit => "C")
      end
      arr
    end

    it "returns 8 if straight flush" do
      hand = Hand.new(cards << double("Card", :number => 6, :suit => "C"))
      expect(hand.strength).to eq(8)
    end
    it "returns 4 if straight" do
      hand = Hand.new(cards << double("Card", :number => 6, :suit => "H"))
      expect(hand.strength).to eq(4)
    end
    it "returns the high card if no other match" do
      hand = Hand.new(cards << double("Card", :number => 13, :suit => "H"))
      expect(hand.strength).to eq(0.13)
    end
  end

  describe "type of hand" do

    describe "#straight_flush" do
      let(:cards) do
        arr = []
        (2..5).each do |n|
          arr << double("Card", :number => n, :suit => "C")
        end
        arr
      end

      it "returns false if cards are not in same suit" do
        hand = Hand.new(cards << double("Card", :number => 6, :suit => "H"))
        expect(hand.straight_flush).to be false
      end

      it "returns false if cards do not increment by one" do
        hand = Hand.new(cards << double("Card", :number => 10, :suit => "C"))
        expect(hand.straight_flush).to be false
      end

      it "returns true if straight flush" do
        hand = Hand.new(cards << double("Card", :number => 6, :suit => "C"))
        expect(hand.straight_flush).to be true
      end
    end

    describe "#four_of_a_kind" do
      let(:cards) do
        arr = []
        3.times do
          arr << double("Card", :number => 5, :suit => nil)
        end
        arr << double("Card", :number => 10, :suit => nil)
      end

      it "returns true if 4 cards have the same number" do
        hand = Hand.new(cards << double("Card", :number => 5, :suit => nil))
        expect(hand.four_of_a_kind).to be true
      end
      it "returns false if less than 4 cards have the same number" do
        hand = Hand.new(cards << double("Card", :number => 8, :suit => nil))
        expect(hand.four_of_a_kind).to be false
      end
    end

    describe "#full_house" do
      let(:cards) do
        arr = []
        3.times do
          arr << double("Card", :number => 5, :suit => nil)
        end
        arr << double("Card", :number => 10, :suit => nil)
      end

      it "returns true if full house" do
        hand = Hand.new(cards << double("Card", :number => 10, :suit => nil))
        expect(hand.full_house).to be true
      end
      it "returns fase if not full house" do
        hand = Hand.new(cards << double("Card", :number => 2, :suit => nil))
        expect(hand.full_house).to be false
      end
    end

    describe "#flush" do
      let(:cards) do
        arr = []
        4.times do
          arr << double("Card", :number => nil, :suit => "C")
        end
        arr
      end

      it "returns true if 5 cards of same suit" do
        hand = Hand.new(cards << double("Card", :number => nil, :suit => "C"))
        expect(hand.flush).to be true
      end
      it "returns false if less than 5 cards of same suit" do
        hand = Hand.new(cards << double("Card", :number => nil, :suit => "D"))
        expect(hand.flush).to be false
      end
    end

    describe "#straight" do
      let(:cards) do
        arr = []
        (2..5).each do |n|
          arr << double("Card", :number => n, :suit => nil)
        end
        arr
      end

      it "returns true if cards increment by one" do
        hand = Hand.new(cards << double("Card", :number => 6, :suit => nil))
        expect(hand.straight).to be true
      end
      it "returns false if cards do not increment by one" do
        hand = Hand.new(cards << double("Card", :number => 10, :suit => nil))
        expect(hand.straight).to be false
      end
    end

    describe "#three_of_a_kind" do
      let(:cards) do
        arr = []
        2.times do
          arr << double("Card", :number => 5, :suit => nil)
          arr << double("Card", :number => 10, :suit => nil)
        end
        arr
      end

      it "returns true if 3 cards have the same number" do
        hand = Hand.new(cards << double("Card", :number => 5, :suit => nil))
        expect(hand.three_of_a_kind).to be true
      end
      it "returns false if less than 3 cards have the same number" do
        hand = Hand.new(cards << double("Card", :number => 2, :suit => nil))
        expect(hand.three_of_a_kind).to be false
      end
    end

    describe "#two_pair" do
      let(:cards) do
        arr = []
        2.times do
          arr << double("Card", :number => 5, :suit => nil)
        end
        arr << double("Card", :number => 10, :suit => nil)
        arr << double("Card", :number => 2, :suit => nil)
      end

      it "returns true if 2 pairs, each having the same number" do
        hand = Hand.new(cards << double("Card", :number => 10, :suit => nil))
        expect(hand.two_pair).to be true
      end
      it "returns false if less than 2 pairs" do
        hand = Hand.new(cards << double("Card", :number => 3, :suit => nil))
        expect(hand.two_pair).to be false
      end
    end

    describe "#one_pair" do
      let(:cards) do
        arr = []
        arr << double("Card", :number => 2, :suit => nil)
        arr << double("Card", :number => 3, :suit => nil)
        arr << double("Card", :number => 5, :suit => nil)
        arr << double("Card", :number => 10, :suit => nil)
      end

      it "return true if 2 cards have the same number" do
        hand = Hand.new(cards << double("Card", :number => 5, :suit => nil))
        expect(hand.one_pair).to be true
      end
      it "returns false if no cards have the same number" do
        hand = Hand.new(cards << double("Card", :number => 4, :suit => nil))
        expect(hand.one_pair).to be false
      end
    end

    describe "#high_card" do
      let(:cards) do
        arr = []
        arr << double("Card", :number => 2, :suit => nil)
        arr << double("Card", :number => 3, :suit => nil)
        arr << double("Card", :number => 5, :suit => nil)
        arr << double("Card", :number => 10, :suit => nil)
        arr << double("Card", :number => 14, :suit => nil)
      end

      it "returns the high card" do
        hand = Hand.new(cards)
        expect(hand.high_card).to eq(0.14)
      end
    end
  end
end


# variables vs let??