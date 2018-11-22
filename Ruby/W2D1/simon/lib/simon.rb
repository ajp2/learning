class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    seq.each do |color|
      system("clear")
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Enter the colors in the order they appear, separated by commas: "
    input = gets.chomp.split(",")

    self.game_over = true if input != seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You pass this round!"
    sleep(1)
  end

  def game_over_message
    puts "Game over! Incorrect sequence"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  game = Simon.new
  game.play
end