require_relative "hand.rb"

class Player
  attr_reader :hand, :name
  attr_accessor :pot

  def initialize(name)
    @name = name
    @hand = Hand.new([])
    @pot = 0
  end

  def dealt_cards(arr_of_cards)
    @hand.cards += arr_of_cards
  end

  def player_bet
    puts "#{@name}, Would you like to fold (F), see (S), or raise (R)?"
    bet = gets.chomp
    amount = 0

    if bet == "R"
      puts "What is the total amount you would like to bet?"
      amount = gets.chomp.to_i
    end

    raise "Invalid input!" if !["F", "S", "R"].include?(bet[0].upcase)
    [bet, amount]
  end

  def discard
    puts "#{@name} which cards would you like to discard? Your cards are: #{@hand.to_s}"
    puts "Enter cards separated by commas: 5H, 11C; enter an empty string otherwise"
    cards_to_discard = gets.chomp.split(",")

    # return [] if cards_to_discard.length == 0


    cards_to_discard
  end
end