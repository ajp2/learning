require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"
require "byebug"

class Game
  def initialize(n = 4)
    @board = Board.new(n)
    @prev_guess = nil
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def play
    @board.populate

    until @board.won?
      puts "-------------------"
      @board.render
      # guessed_pos = @human.guess
      guessed_pos = @computer.guess

      next if !guessed_pos
      make_guess(guessed_pos)
    end

    puts "-------------------"
    @board.render
    puts "You win!!"
  end

  def make_guess(guessed_pos)
    guessed_card = @board.reveal(guessed_pos)
    return nil if guessed_card.nil?

    @computer.receive_revealed_card(guessed_pos, guessed_card)

    if !@prev_guess
      @prev_guess = [guessed_card, guessed_pos]
    else
      if guessed_card != @prev_guess[0]
        @board.render
        sleep(1)
        guessed_card.hide
        @prev_guess[0].hide
        system("clear")
      else
        @computer.receive_match(@prev_guess[1], guessed_pos)
      end
      @prev_guess = nil
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play
end