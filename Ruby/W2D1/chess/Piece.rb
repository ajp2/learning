module SlidingPiece
  HORIZONTAL_DIRS = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]
  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
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
      new_moves = move_in_dir(dir)
      unless possible_moves.include?(new_moves) || new_moves == self.pos
        possible_moves += new_moves 
      end
    end

    possible_moves
  end

  private
  def move_in_dir(dir)
    hit_piece = false
    next_pos = self.pos
    all_moves_in_dir = []

    until hit_piece
      previous_pos = next_pos.dup
      next_pos = grow_unblocked_moves_in_dir(next_pos, dir)

      # Not a valid pos, move back. Can't go futher so break
      if !(self.valid_pos?(next_pos))
        next_pos = previous_pos
        break
      end

      # Reached a piece
      if self.board[next_pos[0]][next_pos[1]].symbol # change this after nil positions become objects
        # Same color, move back
        next_pos = previous_pos if self.color == self.board[next_pos[0]][next_pos[1]].color
        hit_piece = true
      end

      all_moves_in_dir << next_pos
    end

    all_moves_in_dir
  end
  
  def grow_unblocked_moves_in_dir(next_pos, dir)
    x, y = next_pos
    dx, dy = dir
    [x + dx, y + dy]
  end
end


module SteppingPiece
  def moves
    possible_moves = []

    self.move_diffs.each do |move|
      new_pos = [self.pos[0] + move[0], self.pos[1] + move[1]]

      if self.board.valid_pos?(new_pos)
        next if self.board[new_pos[0]][new_pos[1]] && self.color == self.board[new_pos[0]][new_pos[1]].color
        possible_moves << new_pos
      end
    end

    possible_moves
  end
end



class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    self.symbol
  end

  def empty?
    return true if self.symbol.nil?
    false
  end

  def valid_pos?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
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
    :pawn
  end

  def moves
    possible_moves = []

    # enumerable to check for more than one step
    forward_steps.each do |forward_step|
      forward_x = self.pos[0] + forward_dir + forward_step
      forward_y = self.pos[1]
      possible_moves << [forward_x, forward_y] if self.board[forward_x][forward_y].symbol.nil?
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
    colors = {:white => :black, :black => :white}
    x, y = self.pos[0], self.pos[1]
    moves = []

    # diagonal left and right positions
    pieces = [[x + forward_dir, y - 1], [x + forward_dir, y + 1]]

    # add move if diagonal piece is opponent piece
    pieces.each do |piece|
      moves << piece if self.board[piece[0]][piece[1]].color == colors[self.color]
    end

    moves
  end
end

class NullPiece < Piece
  # include Singleton

  attr_reader :color, :symbol

  def initialize
    @color = nil
  end

  def symbol
    nil
  end
end