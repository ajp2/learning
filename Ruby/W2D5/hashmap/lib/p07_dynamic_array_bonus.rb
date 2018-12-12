class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable

  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i < (@count * -1) || i >= @count
    idx = @count == 0 ? 0 : i % @count
    @store[idx]
  end

  def []=(i, val)
    return nil if i < (@count * -1) || i >= @count
    idx = @count == 0 ? 0 : i % @count
    @store[idx] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    @store.store.each do |el|
      return true if el == val
    end

    false
  end

  def push(val)
    resize! if @count >= @store.length
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    resize! if @count >= @store.length
    new_store = StaticArray.new(@store.length * 2)

    new_count = 1
    @store.store.each do |el|
      new_store[new_count] = el
      new_count += 1
    end

    @count += 1
    new_store[0] = val
    @store = new_store
  end

  def pop
    return nil if @count == 0
    val = @store[@count - 1]
    @store[@count - 1] = nil
    @count -= 1
    return val
  end

  def shift
    return nil if @count <= 0
    val = @store[0]
    @store.store.each_with_index do |el, idx|
      next if idx == 0
      @store[idx - 1] = el
    end
    @store[@count - 1] = nil
    @count -= 1
    return val
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each(&prc)
    @store.store.each do |el|
      prc.call(el)
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
    self.each_with_index do |el, idx|
      break if @count == idx
      return false if el != other[idx]
    end

    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(@store.length * 2)
    @store.store.each_with_index do |el, idx|
      new_store[idx] = el
    end

    @store = new_store
  end
end
