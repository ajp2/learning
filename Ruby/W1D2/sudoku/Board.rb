require_relative "Tile.rb"

class Board
  def initialize(grid)
    @grid = grid
    @NUMS_TO_COMPLETE = (1..@grid.length).to_a
  end

  def self.from_file(file_name)
    grid_arr = []

    File.foreach(file_name) do |line|
      row = []

      line.chomp.split("").map do |ele|
        val = ele.to_i
        if val == 0
          row << Tile.new(val, true)
        else
          row << Tile.new(val)
        end
      end

      grid_arr << row
    end
    grid_arr
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = Tile.new(val, true)
  end

  def render
    system("clear")
    print "  "
    @grid.length.times do |n|
      print "#{n} "
      print "  " if n % 3 == 2
    end
    puts

    @grid.each_with_index do |row, idx1|
      print idx1.to_s + " "
      row.each_with_index do |tile, idx2|
        print tile.to_s + " "
        print "| " if idx2 % 3 == 2 && idx2 != row.length - 1
      end

      puts
      puts "  = = = = = = = = = = =" if idx1 % 3 == 2 && idx1 != @grid.length - 1
    end
  end

  def solved?
    if row_solved? && col_solved? && square_solved?
      return true
    end
    false
  end

  def row_solved?
    @grid.each do |row|
      return false if tile_arr_to_val(row).sort != @NUMS_TO_COMPLETE
    end
    true
  end

  def col_solved?
    grid_as_col = @grid.transpose
    grid_as_col.each do |col|
      return false if tile_arr_to_val(col).sort != @NUMS_TO_COMPLETE
    end
    true
  end

  def square_solved?
    three_col_arr = Array.new(@grid.length / 3) { [] }
    @grid.each do |row|
      (@grid.length / 3).times do |n|
        three_col_arr[n] += row[(n*3)..(n*3)+2]
      end
    end

    three_col_arr.each do |three_col|
      (@grid.length / 3).times do |n|
        square = three_col[(n*9)..(n*9)+8]
        return false if tile_arr_to_val(square).sort != @NUMS_TO_COMPLETE
      end
    end
    true
  end

  def tile_arr_to_val(tile_arr)
    tile_arr.map { |tile| tile.value }
  end

  attr_accessor :grid
end
