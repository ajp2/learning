require_relative "min_max_stack_queue.rb"

def windowed_max_range(arr, w)
  current_max_range = nil
  store = MinMaxStackQueue.new

  w.times do |n|
    store.enqueue(arr[n])
  end

  (arr.length - w).times do |idx|
    store.dequeue
    store.enqueue(arr[w + idx])

    range = store.max - store.min
    current_max_range = range if !current_max_range || range > current_max_range
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8