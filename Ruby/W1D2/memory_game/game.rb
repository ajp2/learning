require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
  def initialize(player, n = 4)
    @board = Board.new(n)
    @prev_guess = nil
    @player = player
  end

  def play
    system("clear")
    @board.populate

    until @board.won?
      @board.render
      guessed_pos = @player.guess

      next if !guessed_pos
      make_guess(guessed_pos)
    end

    system("clear")
    @board.render
    puts "You win!!"
  end

  def make_guess(guessed_pos)
    guessed_card = @board.reveal(guessed_pos)
    return nil if guessed_card.nil?

    @player.receive_revealed_card(guessed_pos, guessed_card)

    if !@prev_guess
      @prev_guess = [guessed_card, guessed_pos]
    else
      if guessed_card != @prev_guess[0]
        system("clear")
        @board.render
        puts "No match"
        sleep(1.7)
        guessed_card.hide
        @prev_guess[0].hide
        system("clear")
      else
        puts "Match!"
        sleep(1.7)
        @player.receive_match(@prev_guess[1], guessed_pos)
      end
      @prev_guess = nil
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  # human = HumanPlayer.new
  computer = ComputerPlayer.new
  game = Game.new(computer)
  game.play
end