require_relative "card.rb"

class Board
  VALUES = ("A".."Z").to_a

  def initialize(n)
    @grid = Array.new(n) { [] }
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, val)
    row, col = position
    @grid[row][col] = val
  end

  def populate
    grid_size = @grid.length

    list_of_cards = []
    ((grid_size ** 2) / 2).times do
      card_val = VALUES.sample
      list_of_cards += [Card.new(card_val), Card.new(card_val)]
    end
    list_of_cards.shuffle!

    @grid.each do |sub_arr|
      grid_size.times do
        sub_arr << list_of_cards.pop
      end
    end

    true
  end

  def render
    puts "  0 1 2 3"
    print_grid = @grid.map.with_index do |sub_arr, idx|
      print idx.to_s + " "
      sub_arr.map do |card|
        if card.face_up
          print card.face_value + " "
        else
          print "#" + " "
        end
      end
      puts
    end
  end

  def won?
    @grid.all? { |sub_arr| sub_arr.all? { |card| card.face_up } }
  end

  def reveal(guessed_pos)
    card_at_position = self[guessed_pos]
    if !card_at_position.face_up
      card_at_position.reveal
      return card_at_position
    end
  end

  def cheat
    @grid.map { |sub_arr| sub_arr.map { |card| card.to_s } }
  end
end