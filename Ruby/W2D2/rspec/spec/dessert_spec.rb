require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Jeff") }
  subject { Dessert.new("Brownie", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("Brownie")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Brownie", "ten", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(subject.add_ingredient("chocolate")).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each { |ingredient| subject.add_ingredient(ingredient) }
      expect(subject.ingredients).to eq(ingredients)
      subject.mix!
      expect(subject.ingredients).not_to eq(ingredients)
      expect(subject.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(6)
      expect(subject.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { subject.eat(15) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jeff the Great Baker")
      expect(subject.serve).to eq("Chef Jeff the Great Baker has made 10 Brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(subject)
      subject.make_more
    end
  end
end
