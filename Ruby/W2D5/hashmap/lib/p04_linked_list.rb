class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @next, @prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    self.each do |current_node|
      return current_node.val if current_node.key == key
    end

    nil
  end

  def include?(key)
    self.each do |current_node|
      return true if current_node.key == key
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    new_node.next = @tail
    new_node.prev = last
    last.next = @tail.prev = new_node
  end

  def update(key, val)
    self.each do |current_node|
      if current_node.key == key
        current_node.val = val
        return true
      end
    end

    false
  end

  def remove(key)
    self.each do |current_node|
      if current_node.key == key
        current_node.remove
        return true
      end
    end

    false
  end

  def each(&prc)
    current_node = first
    until current_node.next.nil?
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
