require_relative "min_max_stack.rb"

class MinMaxStackQueue
  def initialize
    @store = MinMaxStack.new
    @store_reversed = MinMaxStack.new
  end

  def size
    @store.size + @store_reversed.size
  end

  def empty?
    @store.empty? && @store_reversed.empty?
  end

  def max
    maxes = []
    maxes << @store.max unless @store.empty?
    maxes << @store_reversed.max unless @store_reversed.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @store.min unless @store.empty?
    mins << @store_reversed.min unless @store_reversed.empty?
    mins.min
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