require_relative "polytreenode.rb"

class KnightPathFinder
  def initialize(starting_pos)
    @root_node = PolyTreeNode.new(starting_pos)
    @visited_positions = [starting_pos]
    build_move_tree
  end

  def self.valid_moves(pos)
    moves = []

    row_start, row_end = pos[0] - 2, pos[0] + 2
    col_start, col_end = pos[1] - 2, pos[1] + 2

    (row_start..row_end).each do |row_idx|
      next if row_idx < 0 || row_idx > 7
      (col_start..col_end).each do |col_idx|
        next if col_idx < 0 || col_idx > 7

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
    moves = moves.reject { |move| @visited_positions.include?(move) }

    @visited_positions += moves
    moves
  end

  def build_move_tree
    nodes = [@root_node]

    until nodes.empty?
      node = nodes.shift
      new_moves = new_move_positions(node.value)

      new_moves.each do |move|
        new_node = PolyTreeNode.new(move)
        new_node.parent = node
        node.add_child(new_node)
        nodes << new_node
      end
    end

  end

  def find_path(end_pos)
    result_node = @root_node.bfs(end_pos)
    return nil if result_node.nil?

    trace_path_back(result_node)
  end

  def trace_path_back(result_node)
    parent_node = result_node.parent
    path = [result_node.value]

    until parent_node.nil?
      path << parent_node.value
      parent_node = parent_node.parent
    end
    path.reverse
  end

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6])
  p kpf.find_path([6, 2])
end