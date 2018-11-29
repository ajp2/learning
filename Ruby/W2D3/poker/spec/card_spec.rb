# require "rspec"
require "card.rb"

describe Card do
  subject(:card) { Card.new(5, "D") }

  describe "#initialize" do
    
    it "creates a number instance variable" do
      expect(card.number).to eq(5)
    end
    it "creates a suit instance variable" do
      expect(card.suit).to eq("D")
    end
    it "creates a value instance variable" do
      expect(card.value).to eq("5D")
    end

    context "when input is invalid" do
      it "raises an error if number is invalid" do
        expect { Card.new(1, "D") }.to raise_error(ArgumentError, "Number is invalid")
      end
      it "raises an error if suit is invalid" do
        expect { Card.new(5, "T") }.to raise_error(ArgumentError, "Suit is invalid")
      end
      it "raises an error is suit and number is invalid" do
        expect { Card.new(15, "T") }.to raise_error(ArgumentError, "Number and suit are invalid")
      end
    end
  end

  describe "#to_s" do
    it "returns the cards number and suit as a string" do
      expect(card.to_s).to eq("5D")
    end
  end
end