require 'set'
require_relative "player.rb"

class Game
  # attr_reader :current_player, :previous_player

  def initialize(*players)
    @players = players
    @fragment = ""
    @dict = File.new("dictionary.txt").readlines.map(&:chomp).to_set
    @current_player = @players[0]
    @previous_player = @players[-1]
    @losses = Hash.new(0)
  end

  def game_run
    while @players.length >= 2
      play_round
    end
  end

  def play_round
    puts "----------------------"
    display_standings
    @players.length.times do

      @players.each do |player|
        if @losses[player] == 5
          puts "#{player.name} has lost and has been eliminated!!"
          @players.delete(player)
        end
      end

      if @players.length == 1
        puts "Game over! #{@players[0].name} wins!"
        break
      end

      take_turn(@current_player)
      next_player!
    end
  end

  def next_player!
    next_player_index = (@players.index(@current_player) + 1) % @players.length
    @previous_player = @current_player
    @current_player = @players[next_player_index]
  end

  def take_turn(player)
    guess = ""

    loop do
      guess = player.guess(@fragment)

      if valid_play?(guess)
        break
      else
        player.alert_invalid_guess
      end
    end

    @fragment += guess
    if @dict.include?(@fragment)
      puts "You lose. #{@fragment} is in the dictionary"
      puts "----------------------"
      @losses[player] += 1
      @fragment = ""
    end
    
  end

  def valid_play?(string)
    alphabet = ("a".."z")

    in_alphabet = alphabet.include?(string)
    starts_with_string = @dict.to_a.any? { |word| word.start_with?(@fragment + string) }

    return true if in_alphabet && (starts_with_string || @dict.include?(@fragment + string))

    false
  end

  def record(player)
    string = "GHOST"
    return "0 Losses" if @losses[player] == 0

    string[0...@losses[player]]
  end

  def display_standings
    @players.each { |player| puts player.name + ": " + record(player)}
  end
end



if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("P1")
  player2 = Player.new("P2")
  g = Game.new(player1, player2)
  g.game_run
end