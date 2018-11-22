require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner != evaluator
    end

    if @next_mover_mark == evaluator
      return children.all? { |child| child.losing_node?(evaluator) }
    else
      return children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end

    if @next_mover_mark == evaluator
      return children.any? { |child| child.winning_node?(evaluator) }
    else
      return children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_nodes = []

    @board.rows.each_with_index do |row, idx1|
      row.each_with_index do |ele, idx2|
        if @board.empty?([idx1, idx2])
          new_board = @board.dup
          new_board[[idx1, idx2]] = @next_mover_mark
          mark = @next_mover_mark == :x ? :o : :x
          children_nodes << TicTacToeNode.new(new_board, mark, [idx1, idx2])
        end
      end
    end

    children_nodes
  end
end