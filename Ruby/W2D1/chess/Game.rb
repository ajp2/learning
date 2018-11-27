require_relative "Board.rb"
require_relative "Display.rb"
require_relative "player.rb"

class Game
  def initialize
    @display = Display.new
    @board = @display.board

    player1 = HumanPlayer.new(:white, @display)
    player2 = HumanPlayer.new(:black, @display)
    @players = { "player1" => player1, "player2" => player2}
    @current_player = @players["player1"]
  end

  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      begin
        @display.render(@display.cursor.cursor_pos)
        puts "#{@current_player.color.to_s}'s turn"
        puts "White in check!" if @board.in_check?(:white)
        puts "Black in check!" if @board.in_check?(:black)

        start_pos, end_pos = player_move

        raise ArgumentError.new("Invalid move! Try again") if !@board[start_pos].moves.include?(end_pos)
        @board.move_piece(start_pos, end_pos)

        # that move leaves you in check for valid move. Move that leaves in check passes ?? Able to take king????
      rescue ArgumentError => e
        puts e.message
        sleep(1)
        system("clear")
        retry
      end

      swap_turn!
    end
    
    winner = @board.checkmate?(:white) ? "Player2, Black" : "Player1, White"
    puts "Checkmate! #{winner} wins"
  end

  def player_move
    start_pos = nil
    end_pos = nil

    until start_pos && end_pos
      move = @current_player.make_move
      end_pos = move if start_pos && move
      start_pos = check_start_pos(move) if move && !end_pos

      system("clear")
      @display.render(@display.cursor.cursor_pos)
      puts "#{@current_player.color.to_s}'s turn"
    end

    [start_pos, end_pos]
  end

  private
  def swap_turn!
    if @current_player == @players["player1"]
      @current_player = @players["player2"]
    else
      @current_player = @players["player1"]
    end
  end

  def check_start_pos(start_pos)
    return start_pos if @board[start_pos].color == @current_player.color
    raise ArgumentError.new("Cannot move an empty position!") if @board[start_pos].empty?
    raise ArgumentError.new("Not your turn! Try again")
  end
end




game = Game.new

game.play
