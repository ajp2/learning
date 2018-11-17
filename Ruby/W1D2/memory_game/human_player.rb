class HumanPlayer
  def guess
    puts "Enter a position like: 1 1 or 2 3"
    guessed_pos = gets.chomp.split.map(&:to_i)

    if !valid_guess?(guessed_pos)
      puts "Invalid input. Try again"
      return false
    end

    guessed_pos
  end

  def valid_guess?(guessed_pos)
    is_num = guessed_pos[0].is_a?(Numeric) && guessed_pos[1].is_a?(Numeric)
    if is_num && (guessed_pos[0].between?(0, 3) && guessed_pos[1].between?(0, 3))
      return true
    end
    false
  end

  def receive_revealed_card(position, card_value)
  end

  def receive_match(position1, position2)
  end
end