require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.length.times do |n|
      if !(n == 6 || n == 13)
        self.cups[n] = [:stone] * 4
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos].nil?
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].dup
    @cups[start_pos] = []

    next_cup = start_pos + 1
    until stones.empty?
      next_cup = next_cup % @cups.length

      if (current_player_name == @player1 && next_cup == 13) ||
        (current_player_name == @player2 && next_cup == 6)
        next_cup += 1
      else
        @cups[next_cup].push(stones.pop)
        next_cup += 1
      end
    end

    render
    next_turn(next_cup - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length

    @cups[6].length > @cups[13].length ? @player1 : @player2
  end
end