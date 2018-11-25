require_relative "Piece.rb"
require "byebug"

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, nil) }
    place_pieces
  end

  # call by using self[x, y] ??
  # def [](pos)
  #   puts "zxgaxfgzfgdflgjk"
  #   x, y = pos
  #   @board[x][y]
  # end

  # def []=(pos, value)
  #   x, y = pos
  #   @board[x][y] = value
  # end

  def place_pieces
    @board.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        if x.between?(0, 1) || x.between?(6, 7)
          @board[x][y] = Piece.new
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    x1, y1 = start_pos
    x2, y2 = end_pos
    raise ArgumentError.new("No piece at start_pos") if @board[x1][y1].nil?
    raise ArgumentError.new("end_pos is invalid") unless valid_pos?(end_pos)
    
    @board[x2][y2], @board[x1][y1] = @board[x1][y1], nil
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end
end
