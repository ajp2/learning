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
  end

  describe "#to_s" do
    it "returns the cards number and suit as a string" do
      expect(card.to_s).to eq("5D")
    end
  end
end