require_relative "Tile.rb"

class Board
  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_name)
    grid_arr = []

    File.foreach(file_name) do |line|
      row = []

      line.chomp.split("").map do |ele|
        val = ele.to_i
        row << val == 0 ? Tile.new(val, true) : Tile.new(val)
      end

      grid_arr << row
    end
    grid_arr
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos)
    row, col = pos
    @grid[row][col]
  end

  def render
    @grid.each do |row|
      row.each do |tile|
        print tile
      end
      puts
    end
  end

  attr_accessor :grid
end

a = Board.new(Board.from_file("sudoku1.txt"))
a.render

# b = Tile.new("hello")
# print b.to_s