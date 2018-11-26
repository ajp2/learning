require "singleton"
require_relative "Pieces/sliding_piece.rb"
require_relative "Pieces/stepping_piece.rb"

class Piece
  attr_reader :color
  attr_accessor :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board_class = board
    @board = @board_class.board
    @pos = pos
  end

  def to_s
    self.symbol.to_s
  end

  def empty?
    return true if self.symbol.nil?
    false
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def opposite_color(color)
    color == :white ? :black : :white
  end

  def move_into_check?(end_pos)
    board_copy = @board_class.dup
    @board_class.move_piece!(@pos, end_pos)
    in_check = @board_class.in_check?(self.color)
    @board_class.board = board_copy

    in_check
  end

  def valid_moves
    moves = []
    self.moves.each do |move|
      moves << move unless move_into_check?(move)
    end
    moves
  end
end


class Rook < Piece
  include SlidingPiece

  def symbol
    :R
  end

  def move_dirs
    horizontal_dirs
  end
end


class Bishop < Piece
  include SlidingPiece

  def symbol
    :B
  end

  def move_dirs
    diagonal_dirs
  end
end


class Queen < Piece
  include SlidingPiece

  def symbol
    :Q
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end


class Knight < Piece
  include SteppingPiece

  def symbol
    :k
  end

  def move_diffs
    [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [1, -2],
      [2, -1],
      [2, 1],
      [-1, 2],
      [1, 2]
    ]
  end
end

class King < Piece
  include SteppingPiece

  def symbol
    :K
  end

  def move_diffs
    [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end
end

class Pawn < Piece
  def symbol
    :P
  end

  def moves
    possible_moves = []

    # enumerable to check for more than one step
    forward_steps.each do |forward_step|
      forward_x = self.pos[0] + forward_dir + forward_step
      forward_y = self.pos[1]
      possible_moves << [forward_x, forward_y] if self.board[forward_x][forward_y].empty?
    end
    
    possible_moves += side_attacks
  end

  protected
  def forward_dir
    # white starts at bottom of board
    self.color == :white ? -1 : 1
  end

  def at_start_row?
    if self.color == :white
      return true if self.pos[0] == 6
    elsif self.color == :black
      return true if self.pos[0] == 1
    end
    false
  end

  def forward_steps
    at_start_row? ? [0, 1] : [0]
  end

  def side_attacks
    x, y = self.pos[0], self.pos[1]
    moves = []

    # diagonal left and right positions
    pieces = [[x + forward_dir, y - 1], [x + forward_dir, y + 1]]

    # add move if diagonal piece is opponent piece
    pieces.each do |piece|
      next if !self.valid_pos?(piece)
      moves << piece if self.board[piece[0]][piece[1]].color == self.opposite_color(self.color)
    end

    moves
  end
end

class NullPiece < Piece
  include Singleton

  attr_reader :color, :symbol

  def initialize
    @color = nil
    @symbol = nil
  end
end