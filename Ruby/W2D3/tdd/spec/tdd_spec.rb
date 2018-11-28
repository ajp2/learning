require "rspec"
require "tdd.rb"

describe "#my_uniq" do
  it "returns an array of unique elements" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end
end

describe Array do
  describe "#two_sum" do
    it "finds the positions of pairs of numbers which add to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  it "transposes a 2d array into either rows or columns" do
    expect(my_transpose([
      [0, 1, 2], 
      [3, 4, 5], 
      [6, 7, 8]
      ])).to eq([
        [0, 3, 6], 
        [1, 4, 7], 
        [2, 5, 8]
      ])
  end
end

describe "#stock_picker" do
  it "returns pair of positions in array which are most profitable" do
    expect(stock_picker([22, 24, 32, 18, 23, 29, 15])).to eq([3, 5])
  end
end

describe TowersOfHanoi do
  subject(:hanoi) { TowersOfHanoi.new(4) }

  describe "#initialize" do
    it "creates a size instance variable with the value passed in" do
      expect(hanoi.size).to eq(4)
    end

    it "creates a towers instance variable, as an array with 3 subarrays" do
      expect(hanoi.towers.length).to eq(3)
    end

    it "sets the first subarray to the range of values from 1 to num" do
      expect(hanoi.towers[0]).to eq([4, 3, 2, 1])
    end
  end

  describe "#move" do
    it "raises an error if a larger disc is moved on top of a smaller one" do
      hanoi.towers = [[4, 3, 2], [1], []]
      expect { hanoi.move(0, 1) }.to raise_error("Can't place larger disc over smaller one")
    end

    it "raises error when moving from empty tower" do
      expect { hanoi.move(2, 1) }.to raise_error("Tower is empty!")
    end

    it "moves only one disc at a time" do
      hanoi.move(0, 1)
      expect(hanoi.towers[0].length).to eq(3)
    end

    describe "#won?" do
      it "returns false if all discs are not on one tower" do
        hanoi.towers = [[], [4], [3, 2, 1]]
      end

      it "returns true if all discs are moved to the middle tower" do
        hanoi.towers = [[], [4, 3, 2, 1], []]
        expect(hanoi.won?).to eq(true)
      end

      it "returns true if all discs are moved to the right most tower" do
        hanoi.towers = [[], [], [4, 3, 2, 1]]
        expect(hanoi.won?).to eq(true)
      end
    end
  end
end