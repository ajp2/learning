class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @cups.length.times do |n|
      if !(n == 6 || n == 13)
        self.cups[n] = [:stone] * 4
      end
    end
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
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

      if (@current_player_name == @player1 && start_pos == 13) ||
        (current_player_name == @player2 && start_pos == 6)
        next_cup += 1
        next
      end

      @cups[next_cup].push(stones.pop)
      next_cup += 1
    end

    render
    next_turn(start_pos - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

b = Board.new(3,3)
p b.cups