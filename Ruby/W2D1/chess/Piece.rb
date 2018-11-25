class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end


class Rook < Piece
  include SlidingPiece

  def symbol
    :rook
  end

  def move_dirs
    horizontal_dirs
  end
end

# rook = Rook.new(:white, "board", [0,0])
# rook.moves
#   calls rook.move_dirs


class Bishop < Piece
  include SlidingPiece

  def symbol
    :bishop
  end

  def move_dirs
    diagonal_dirs
  end
end


class Queen < Piece
  include SlidingPiece

  def symbol
    :queen
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end


class Knight < Piece
  include SteppingPiece

  def symbol
    :knight
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
    :king
  end

  def move_diffs
    [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ]
  end
end

class Pawn < Piece

end

class NullPiece < Piece
  include Singleton

  def initialize

  end
end








module SlidingPiece
  HORIZONTAL_DIRS = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]
  DIAGONAL_DIRS = [
    [-1, -1],
    [-1. 1],
    [1, -1],
    [1, 1]
  ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    dirs = self.move_dirs
    possible_moves = []
    dirs.each do |dir|
      possible_moves << move_in_dir(dir)
    end

    possible_moves
  end

  private
  # if hit own piece, stop one position before
  # if hit oppo piece, take the piece and stop there
  # otherwise stop when the end of board is reached
  def move_in_dir(dir)
    hit_piece? = false
    next_pos = self.pos

    until hit_piece?
      previous_pos = next_pos.dup
      next_pos = grow_unblocked_moves_in_dir(next_pos, dir)

      # Not a valid pos, move back. Can't go futher so break
      if !(self.board.valid_pos?(next_pos))
        next_pos = previous_pos
        break
      end

      # Reached a piece
      if self.board[next_pos] # change this after nil positions become objects
        # Same color, move back
        next_pos = previous_pos if self.color == self.board[next_pos].color
        hit_piece? = true
      end
    end

    next_pos
  end
  
  def grow_unblocked_moves_in_dir(x, y, dx, dy)
    [x + dx, y + dy]
  end
end

module SteppingPiece
  def moves
    possible_moves = []

    self.move_diffs.each do |move|
      new_pos = [self.pos[0] + move[0], self.pos[1] + move[1]]

      if self.board.valid_pos?(new_pos) && self.color != self.board[new_pos].color
        possible_moves << new_pos
      end
    end

    possible_moves
  end
end