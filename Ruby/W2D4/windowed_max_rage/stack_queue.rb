require_relative "my_stack.rb"

class StackQueue
  def initialize
    @store = MyStack.new
    @store_reversed = MyStack.new
  end

  def size
    @store.size + @store_reversed.size
  end

  def empty?
    @store.empty? && @store_reversed.empty?
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