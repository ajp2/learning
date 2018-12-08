class MinMaxStack
  def initialize
    @store = []
  end

  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    peek[1]
  end

  def min
    peek[2]
  end

  def pop
    last = @store.pop
    last[0]
  end

  def push(ele)
    max_val = empty? ? ele : set_max(ele)
    min_val = empty? ? ele : set_min(ele)
    @store << [ele, max_val, min_val]
  end

  private
  def set_max(ele)
    empty? ? ele : [max, ele].max
  end

  def set_min(ele)
    empty? ? ele : [min, ele].min
  end
end