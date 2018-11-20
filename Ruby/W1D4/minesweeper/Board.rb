require_relative "Tile.rb"

class Board
  attr_reader :game_over

  def initialize
    @board = Array.new(9) { Array.new(9, "*") }
    @board = populate
  end

  def populate
    bombed_tiles = generate_bombed_tiles

    @board.map.with_index do |row, idx1|
      row.map.with_index do |ele, idx2|
        if bombed_tiles.include?([idx1, idx2])
          Tile.new([idx1, idx2], true)
        else
          Tile.new([idx1, idx2])
        end
      end
    end
  end

  def generate_bombed_tiles
    bombed_tiles = []
    10.times do
      pos = [rand(@board.length), rand(@board.length)]
      bombed_tiles << pos if !bombed_tiles.include?(pos)
    end
    bombed_tiles
  end

  def neighbours(pos)
    neighbours_list = []
    row_before, row_after = pos[0] - 1, pos[0] + 1
    col_before, col_after = pos[1] - 1, pos[1] + 1

    (row_before..row_after).each do |row_idx|
      (col_before..col_after).each do |col_idx|
        next if [row_idx, col_idx] == pos
        next if row_idx < 0 || col_idx < 0

        if @board[row_idx] && @board[row_idx][col_idx]
          next if @board[row_idx][col_idx].revealed
          neighbours_list << @board[row_idx][col_idx] 
        end
        
      end
    end

    neighbours_list
  end

  def neighbour_bomb_count(pos)
    neighbours_list = neighbours(pos)
    neighbours_list.count { |tile| tile.bombed }
  end

  def reveal_tile(pos, action)
    x, y = pos[0], pos[1]
    tile = @board[x][y]

    if action == "f" || tile.flagged
      tile.flag
    elsif tile.bombed
      tile.reveal
      render
    else
      tile.reveal
      bomb_count = reveal_neighbour(pos)
      tile.value = bomb_count if bomb_count
    end
  end

  def reveal_neighbour(pos)
    bomb_count = neighbour_bomb_count(pos)
    if bomb_count >= 1
      return bomb_count
    else
      neighbours_list = neighbours(pos)
      neighbours_list.each do |neighbour|
        recursive_bomb_count = reveal_tile(neighbour.pos, "r")
      end
    end

    nil
  end

  def render
    system("clear")

    print "  "
    @board.length.times { |n| print n.to_s + " " }
    puts

    @board.each_with_index do |row, idx|
      print idx.to_s + " "
      row.each do |tile|
        reveal_char = tile.value ? tile.value.to_i : "-"
        reveal_char = "B" if tile.bombed

        if tile.revealed
          print "#{reveal_char} "
        elsif tile.flagged
          print "F "
        else
          print "* "
        end
      end
      puts
    end
  end

  def lose?
    @board.flatten.any? { |tile| tile.revealed && tile.bombed }
  end

  def win?
    @board.flatten.all? { |tile| tile.revealed || tile.bombed }
  end

  def game_over?
    win? || lose?
  end
end