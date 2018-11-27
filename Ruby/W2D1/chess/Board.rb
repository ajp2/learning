require_relative "Pieces/Piece.rb"
require "byebug"

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8, NullPiece.instance) }
    place_pieces
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

  def place_pieces
    @board.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        if x.between?(0, 1) || x.between?(6, 7)
          self[[x, y]] = new_piece(x, y)
        end
      end
    end
  end

  def new_piece(x, y)
    color = x <= 1 ? :black : :white
    pos = [x, y]
    piece = nil

    return Pawn.new(color, self, pos) if x == 1
    return Pawn.new(color, self, pos) if x == 6
    
    case y
    when 0, 7
      piece = Rook.new(color, self, pos)
    when 1, 6
      piece = Knight.new(color, self, pos)
    when 2, 5
      piece = Bishop.new(color, self, pos)
    when 3
      piece = Queen.new(color, self, pos)
    when 4
      piece = King.new(color, self, pos)
    end

    piece
  end

  def move_piece(start_pos, end_pos)
    x1, y1 = start_pos
    x2, y2 = end_pos
    raise ArgumentError.new("No piece at start_pos") if self[start_pos].nil?
    raise ArgumentError.new("end_pos is invalid") unless valid_pos?(end_pos)
    raise ArgumentError.new("That move leaves you in check!") if !self[start_pos].valid_moves.include?(end_pos)
    
    self[start_pos].pos = end_pos
    self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
  end

  def move_piece!(start_pos, end_pos)
    x1, y1 = start_pos
    x2, y2 = end_pos
    raise ArgumentError.new("No piece at start_pos") if self[start_pos].nil?
    raise ArgumentError.new("end_pos is invalid") unless valid_pos?(end_pos)
    
    self[start_pos].pos = end_pos
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def in_check?(color)
    king_pos = find_king(color)

    @board.each_index do |x|
      @board[x].each_with_index do |piece, y|
        if piece.color == piece.opposite_color(color)
          return true if piece.moves.include?(king_pos)
        end
      end
    end

    false
  end

  def checkmate?(color)
    if in_check?(color)
      @board.each do |row|
        row.each do |piece|
          return false if piece.color == color && piece.valid_moves.length >= 1
        end
      end

      return true
    else
      return false
    end
  end

  def dup
    board_copy = Array.new(8) { Array.new(8, nil) }

    @board.each_index do |x|
      @board[x].each_with_index do |piece, y|
        if piece.empty?
          board_copy[x][y] = piece
        else
          board_copy[x][y] = piece.dup
        end
        board_copy[x][y].board = board_copy unless piece.empty?
      end
    end
    board_copy
  end

  protected
  def find_king(color)
    king_pos = nil
    @board.each_index do |x|
      @board[x].each_with_index do |piece, y|
        king_pos = [x, y] if piece.symbol == :K && piece.color == color
      end
    end

    king_pos
  end

end

# g = Board.new


# g.move_piece([6, 5], [5, 5])
# g.move_piece([1, 4], [3, 4])
# g.move_piece([6, 6], [4, 6])
# g.move_piece([0, 3], [4, 7])
# p g.in_check?(:white)

# p g.board[1][4].move_into_check?([2, 4])
# p g.board[2][3].moves