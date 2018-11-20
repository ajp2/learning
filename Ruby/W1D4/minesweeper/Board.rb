require_relative "Tile.rb"

class Board
  def initialize
    @board = Array.new(9) { Array.new(9, "*") }
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

  def neighbour_bomb_count
    neighbours_list = neighbours
    neighbours_list.count { |tile| tile.bombed }
  end

  def render
    system("clear")

    print "  "
    @board.length.times { |n| print n.to_s + " " }
    puts

    @board.each_with_index do |row, idx|
      print idx.to_s + " "
      row.each { |tile| print tile + " " }
      puts
    end
  end
end

b = Board.new
b.render