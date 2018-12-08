require_relative "my_stack.rb"

class StackQueue
  def initialize
    @store = MyStack.new
    @store_reversed = MyStack.new
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
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
    min_max = @store.peek[1..-1]
    until @store.empty?
      @store_reversed.push(@store.pop)
    end
    val = @store_reversed.pop[0]
    @store_reversed.push([val] + min_max)
  end

end