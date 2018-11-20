require_relative "Tile.rb"

class Board
  def initialize
    @board = Array.new(9) { Array.new(9, "*") }
    @board = populate
    @lost = false
  end

  def populate
    bombed_tiles = []
    10.times do
      pos = [rand(@board.length), rand(@board.length)]
      bombed_tiles << pos if !bombed_tiles.include?(pos)
    end

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

  def neighbours(pos)
    neighbours_list = []
    row_before, row_after = pos[0] - 1, pos[0] + 1
    col_before, col_after = pos[1] - 1, pos[1] + 1

    (row_before..row_after).each do |row_idx|
      (col_before..col_after).each do |col_idx|
        next if [row_idx, col_idx] == pos
        next if row_idx < 0 || col_idx < 0

        if @board[row_idx][col_idx]
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
    if action == "f"
      @board[x][y].flag
    else
      @board[x][y].reveal
      @lost = true if @board[x][y].bombed

      # neighbours_list = neighbours(pos)
      # neighbours_list.each do |neighbour_tile|
      #   bomb_count = neighbour_bomb_count(pos)
      #   if bomb_count >= 1
      #     # stuff
      #   end
      # end
    end
  end

  def render
    # system("clear")

    print "  "
    @board.length.times { |n| print n.to_s + " " }
    puts

    @board.each_with_index do |row, idx|
      print idx.to_s + " "
      row.each do |tile|
        if tile.revealed
          print "_ "
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
    @lost
  end

  def win?
    @board.all? { |row| row.all? { |tile| tile.revealed || tile.bombed }}
  end

  def cheat
    # system("clear")

    print "  "
    @board.length.times { |n| print n.to_s + " " }
    puts

    @board.each_with_index do |row, idx|
      print idx.to_s + " "
      row.each do |tile|
        if tile.bombed
          print "B "
        else
          print "* "
        end
      end
      puts
    end
  end
end