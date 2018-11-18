require_relative "Board.rb"

class Game
  def initialize(sudoku_file)
    @board = Board.new(Board.from_file(sudoku_file))
  end

  def play
    until @board.solved?
      @board.render
      input = prompt_user
      @board[input[0]] = input[1]
    end

    @board.render
    puts "You win!"
  end

  def prompt_user
    input = ""
    until valid_input?(input)
      puts "Enter a position and value like: 1,1 4"
      input = gets.chomp.split
      input[0] = input[0].split(",").map(&:to_i)
      input[1] = input[1].to_i
    end
    input
  end

  def valid_input?(input)
    if input.is_a?(Array) && input[0].is_a?(Array)
      correct_pos = input[0].all? { |num| num >= 0 && num <= @board.grid.length }
      correct_val = input[1] >= 1 && input[1] <= 9
      return true if correct_pos && correct_val
    end
    false
  end
  
end

g = Game.new("sudoku1.txt")
g.play