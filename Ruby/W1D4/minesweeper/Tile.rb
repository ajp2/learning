class Tile
  attr_reader :bombed

  def initialize(pos, board, flagged = false, bombed = false)
    @pos = pos
    @board = board
    @flagged = flagged
    @bombed = bombed
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def neighbours
    neighbours_list = []
    row_before, row_after = @pos[0] - 1, @pos[0] + 1
    col_before, col_after = @pos[1] - 1, @pos[1] + 1

    (row_before..row_after).each do |row_idx|
      (col_before..col_after).each do |col_idx|
        next if [row_idx, col_idx] == @pos
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

  def inspect
    [@pos, @flagged, @bombed]
  end
end


a = Tile.new([1, 1], [[0,1,2,3,4,5,6,7,8], [0,1,2,3,4,5,6,7,8], [0,1,2,3,4,5,6,7,8]])
p a