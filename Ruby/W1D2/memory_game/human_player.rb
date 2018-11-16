class HumanPlayer
  def guess
    puts "Enter a position like: 1 1 or 2 3"
    guessed_pos = gets.chomp.split.map(&:to_i)

    is_num = guessed_pos[0].is_a?(Numeric) && guessed_pos[1].is_a?(Numeric)
    unless is_num && (guessed_pos[0].between?(0, 3) && guessed_pos[1].between?(0, 3))
      puts "Invalid input. Try again"
      return false
    end

    return guessed_pos
  end
end