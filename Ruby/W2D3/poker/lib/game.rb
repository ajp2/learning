require_relative "deck.rb"
require_relative "player.rb"

class Game
  attr_reader :deck, :players

  def initialize(number_of_players = 4)
    @players = sort_players(number_of_players)
    @current_player = @players[0]
    @folded_players = []
    @total_pot = 0
    @previous_raise = 0

    @deck = Deck.new
  end

  def sort_players(number_of_players)
    players_arr = []
    number_of_players.times do |n|
      players_arr << Player.new("Player" + (n + 1).to_s)
    end

    players_arr
  end

  def next_player
    @players.push(@players.shift)
    @current_player = @players[0]
  end


  def play
    deal_cards
    place_bet
    if !check_folded_players
      discard_cards
      place_bet
    end
    
    winner = reveal
    puts "#{winner[0]}, you win"

    # reveal hands if two or more players remaining; strongest hand wins pot
    # if 1 player remaining, they win the pot
  end
  

  private

  def reveal
    strongest = [nil, 0]

    @players.each do |player|
      next if @folded_players.include?(player)
      print player.name + ": " + player.hand.to_s
      puts
      hand_strength = player.hand.strength
      if hand_strength > strongest[1]
        strongest = [player.name, hand_strength]
      end
    end
    strongest
  end

  def deal_cards(list_of_players = @players, num = 5)
    list_of_players.each do |player|
      cards_to_deal = @deck.card_deck.pop(num)
      player.dealt_cards(cards_to_deal)
    end
  end

  def place_bet
    loop do
      puts "Pot is #{@total_pot}"

      if !@folded_players.include?(@current_player)
        handle_bet
        break if check_folded_players
      end
      next_player

      @players.each do |player|
        print player.name + ": " + player.pot.to_s + ", "
      end
      puts

      current_bet = @current_player.pot
      break if @players.all? { |player| player.pot == current_bet }
    end
  end

  def handle_bet
    bet = @current_player.player_bet

    if bet[0] == "F"
      @folded_players << @current_player
    elsif bet[0] == "S"
      call_amount = @players[1].pot - @current_player.pot

      puts "#{@current_player.name} has called. You have bet #{call_amount}"
      @total_pot += call_amount
      @current_player.pot += call_amount
    elsif bet[0] == "R"
      puts "#{@current_player.name} has raised by #{bet[-1] - @previous_raise}. You have bet #{bet[-1]}"
      @total_pot += bet[-1]
      @current_player.pot += bet[-1]
      @previous_raise = bet[-1]
    end
  end

  def check_folded_players
    return true if @players.length - @folded_players.length == 1
  end

  def discard_cards
    @players.each do |player|
      cards = player.discard
      player.hand.cards.each_with_index do |card, idx|
        player.hand.cards.delete_at(idx) if cards.include?(card.value)
      end
      deal_cards([player], cards.length)
    end
  end

end

g = Game.new(3)
g.play