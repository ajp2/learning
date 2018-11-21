class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    @map.each_with_index do |pair, idx|
      if pair[0] == key
        @map[idx] = [key, value]
        return
      end
    end
    @map << [key,value]
  end

  def get(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
  end

  def delete(key)
    @map.each_with_index { |pair, idx| @map[idx].delete if pair[0] == key }
  end

  def show
    @map
  end
end