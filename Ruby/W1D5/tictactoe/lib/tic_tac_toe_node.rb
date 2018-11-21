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
      return true if @board.winner == evaluator
      return false if @board.winner != evaluator
    end
  end

  def winning_node?(evaluator)
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
          @prev_move_pos = [idx1, idx2]

          children_nodes << TicTacToeNode.new(new_board, mark, @prev_move_pos)
        end
      end
    end

    @next_mover_mark = @next_mover_mark == :x ? :o : :x   

    children_nodes
  end
end


b = Board.new
t = TicTacToeNode.new(b, :x)
t.children