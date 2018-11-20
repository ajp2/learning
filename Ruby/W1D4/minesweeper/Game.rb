require_relative "Board.rb"

class Game
  def initialize
    @board = Board.new
  end

  def run
    until @board.win? || @board.lose?
      @board.cheat
      @board.render
      guess = input
      @board.reveal_tile(guess[0..1].map(&:to_i), guess[2])
    end

    if @board.win?
      puts "Congratulations! You win!"
    elsif @board.lose?
      puts "You revealed a bomb! You lose!"
    end
  end

  def input
    guess = ""
    until valid_input?(guess)
      puts "Enter a position and if you want to reveal (r) or flag (f) that tile"
      puts "Example: 1,1,f or 5,3,r"
      guess = gets.chomp.split(",")
    end
    guess
  end

  def valid_input?(guess)
    begin
      correct_els = Integer(guess[0]) && Integer(guess[1]) && (guess[2] == "f" || guess[2] == "r")
      return true if guess.is_a?(Array) && guess.length == 3 && correct_els
      p [guess.is_a?(Array), guess.length == 3, correct_els]
      puts "Invalid input!"
      false
    rescue
      false
    end
  end
end

g = Game.new
g.run