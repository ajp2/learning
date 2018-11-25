require "colorize"
require_relative "Board.rb"
require_relative "cursor.rb"

class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
    @selected = false
  end

  def render(cursor_pos)
    print "  "
    @board.board.each_index { |idx| print "#{idx.to_s} ".colorize(:red) }
    puts

    @board.board.each_with_index do |row, x|
      print "#{x.to_s} ".colorize(:red)

      row.each_with_index do |col, y|
        print_value = col.nil? ? "0 " : "1 "

        if [x, y] == cursor_pos
          if @selected
            print print_value.colorize(:blue)
          else
            print print_value.colorize(:green) 
          end
        else
          print print_value
        end

      end
      puts

    end
    puts "---------------------"
  end

  def toggle_selected
    @selected = @selected ? false : true
  end

  def play
    render(@cursor.cursor_pos)
    while true
      toggle_selected if @cursor.get_input
      system("clear")
      render(@cursor.cursor_pos)
    end
  end
end