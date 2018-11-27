require "colorize"
require_relative "Board.rb"
require_relative "cursor.rb"

class Display
  attr_reader :board, :cursor

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def render(cursor_pos)
    chess_letters = ("A".."H").to_a

    print "  "
    @board.board.each_index { |idx| print "#{chess_letters[idx]} ".colorize(:red) }
    puts

    @board.board.each_with_index do |row, x|
      print "#{x.to_s} ".colorize(:red)

      row.each_with_index do |col, y|
        print_value = col.symbol.nil? ? "-" : col.to_s

        if [x, y] == cursor_pos
          if @cursor.selected
            print print_value.colorize(:blue)
          else
            print print_value.colorize(:green)
          end
        else
          print print_value
        end
        print " "

      end
      puts

    end
    puts "---------------------"
  end
end

# d = Display.new

# d.board.move_piece([6, 5], [5, 5])
# d.board.move_piece([1, 4], [3, 4])
# d.board.move_piece!([6, 6], [4, 6])
# d.board.move_piece([0, 3], [4, 7])
# # p d.board.in_check?(:white)
# p d.board.checkmate?(:white)

# d.play