class ComputerPlayer
  def initialize
    @prev_guess = nil
    @known_cards = {}
    @matched_cards = []
  end

  def guess
    guess_pos = position_if_match

    return guess_pos if guess_pos
    random_position
  end

  def position_if_match
    @known_cards.each do |key1, val1|
      next if @matched_cards.include?(key1)

      @known_cards.each do |key2, val2|
        next if @matched_cards.include?(key2)

        # Set guess if value of previous guess is in known cards
        # and posiitons are different
        if @known_cards[@prev_guess] == val2 && @prev_guess != key2
          @prev_guess = nil
          return key2
        # Set guess if two cards of same value
        elsif val1 == val2 && key1 != key2
          @prev_guess = key1
          return key1
        end
      end
    end

    nil
  end

  def random_position
    guess_pos = nil

    loop do
      row = (0..3).to_a.sample
      col = (0..3).to_a.sample
      guess_pos = [row, col]

      break if !@matched_cards.include?(guess_pos)
    end

    guess_pos
  end

  def receive_revealed_card(position, card_value)
    @known_cards[position] = card_value
  end

  def receive_match(position1, position2)
    @matched_cards += [position1, position2]
  end
end