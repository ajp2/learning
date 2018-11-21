require_relative "polytreenode.rb"

class KnightPathFinder
  def initialize(starting_pos)
    @root_node = PolyTreeNode.new(starting_pos)
    @visited_positions = [starting_pos]
  end

  def self.valid_moves(pos)
    moves = []

    row_start, row_end = pos[0] - 2, pos[0] + 2
    col_start, col_end = pos[1] - 2, pos[1] + 2

    (row_start..row_end).each do |row_idx|
      next if row_idx < 0 || row_idx > 8
      (col_start..col_end).each do |col_idx|
        next if col_idx < 0 || col_idx > 8

        moves << [row_idx, col_idx] if valid_knight_move(pos, [row_idx, col_idx])
      end
    end
    moves
  end

  def self.valid_knight_move(pos, check_pos)
    row_diff = (pos[0] - check_pos[0]).abs
    col_diff = (pos[1] - check_pos[1]).abs

    (row_diff == 2 && col_diff == 1) || (row_diff == 1 && col_diff == 2)
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    moves = moves.select { |move| !@visited_positions.include?(move) }

    @visited_positions << moves
    moves
  end

  def build_move_tree

  end
end