require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_nodes = []

    @board.each_with_index do |row, idx1|
      row.each_with_index do |ele, idx2|
        if @board.empty?([idx1, idx2])
          new_board = @board.dup
          new_board[idx1, idx2] = @next_mover_mark
          children_nodes << new_board

          @next_mover_mark = @next_mover_mark == :x ? :o : :x
          @prev_move_pos = [idx1, idx2]
        end
      end
    end

    children_nodes
  end
end
