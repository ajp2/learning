require_relative "min_max_stack.rb"

class MinMaxStackQueue
  def initialize
    @store = MinMaxStack.new
    @store_reversed = MinMaxStack.new
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    if !@store.empty? && !@store_reversed.empty?
      return [@store.max, @store_reversed.max].max
    elsif !@store.empty?
      return @store.max
    else
      return @store_reversed.max
    end
  end

  def min
    if !@store.empty? && !@store_reversed.empty?
      return [@store.min, @store_reversed.min].min
    elsif !@store.empty?
      return @store.min
    else
      return @store_reversed.min
    end
  end

  def enqueue(ele)
    @store.push(ele)
  end

  def dequeue
    reverse if @store_reversed.empty?
    @store_reversed.pop
  end

  private
  def reverse
    until @store.empty?
      @store_reversed.push(@store.pop)
    end
  end

end