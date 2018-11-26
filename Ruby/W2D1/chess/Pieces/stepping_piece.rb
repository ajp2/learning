module SteppingPiece
  def moves
    possible_moves = []

    self.move_diffs.each do |move|
      new_pos = [self.pos[0] + move[0], self.pos[1] + move[1]]

      if self.valid_pos?(new_pos)
        next if self.board[new_pos[0]][new_pos[1]] && self.color == self.board[new_pos[0]][new_pos[1]].color
        possible_moves << new_pos
      end
    end

    possible_moves
  end
end