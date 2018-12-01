require "rspec"
require "player.rb"

describe Player do
  subject(:player) { Player.new(2) }

  describe "#initialize" do
    it "creates a player" do
      expect(player.hand).to eq(2)
      expect(player.pot).to eq(0)
    end
  end
end