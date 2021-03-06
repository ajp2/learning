def my_min(arr)
  arr.each do |ele1|
    return ele1 if arr.all? { |ele2| ele1 <= ele2 }
  end
end

def my_min(arr)
  smallest = arr[0]
  arr.each do |ele|
    smallest = ele if ele < smallest
  end

  smallest
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def largest_contiguous_subsum(arr)
  subarrays = []

  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      subarrays << arr[idx1..idx2] if idx2 >= idx1
    end
  end

  subarrays.map { |sub| sub.inject(:+) }.max
end

def largest_contiguous_subsum(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)