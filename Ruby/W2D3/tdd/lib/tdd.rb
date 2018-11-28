def my_uniq(arr)
  uniq_arr = []

  arr.each do |ele|
    uniq_arr << ele unless uniq_arr.include?(ele)
  end

  uniq_arr
end

class Array
  def two_sum
    pairs = []

    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        if idx2 > idx1
          pairs << [idx1, idx2] if ele1 + ele2 == 0
        end
      end
    end

    pairs
  end
end

def my_transpose(arr)
  transposed = []

  arr.each_index do |row|
    row_arr = []
    arr.each_index do |col|
      row_arr << arr[col][row]
    end
    transposed << row_arr
  end

  transposed
end

def stock_picker(arr)
  pair = [nil, nil]
  biggest_profit = 0

  arr.each_with_index do |price1, day1|
    arr.each_with_index do |price2, day2|
      if day2 > day1
        if price2 - price1 > biggest_profit
          pair = [day1, day2]
          biggest_profit = price2 - price1
        end
      end
    end
  end

  pair
end


class TowersOfHanoi
  attr_reader :size
  attr_accessor :towers

  def initialize(size)
    discs = []
    (1..size).each do |n|
      discs.unshift(n)
    end
    @size = size
    @towers = [discs, [], []]
  end

  def move(start_pos, end_pos)
    raise "Tower is empty!" if towers[start_pos].length == 0
    if !towers[end_pos][-1].nil? && towers[start_pos][-1] > towers[end_pos][-1]
      raise "Can't place larger disc over smaller one" 
    end

    towers[end_pos].push(towers[start_pos].pop)
  end

  def won?
    return true if towers[1].length == size || towers[2].length == size
    false
  end

  def play
    begin
      until won?
        puts "A move should be the array value of the staring tower and ending tower"
        puts "e.g. 0,1 will move the smallest disc from tower 1 to tower 2"
        puts "Enter a move: "
        p towers
        input = gets.chomp.split(",").map(&:to_i)
        move(input[0], input[1])
        system("clear")
      end
    rescue
      puts "Not a valid move! Try again!"
      retry
    end

    puts "You win!"
  end
end

# if $PROGRAM_NAME == __FILE__
#   game = TowersOfHanoi.new(4)
#   game.play
# end
