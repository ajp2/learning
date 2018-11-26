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
      if self.board[next_pos[0]][next_pos[1]].symbol
        # Same color, move back
        next_pos = previous_pos if self.color == self.board[next_pos[0]][next_pos[1]].color
        hit_piece = true
      end

      all_moves_in_dir << next_pos unless all_moves_in_dir.include?(next_pos)
    end

    all_moves_in_dir
  end
  
  def grow_unblocked_moves_in_dir(next_pos, dir)
    x, y = next_pos
    dx, dy = dir
    [x + dx, y + dy]
  end
end