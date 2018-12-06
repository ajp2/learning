# O(n^2)
def bad_two_sum?(arr, target)
  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      return true if ele1 + ele2 == target && idx2 > idx1
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#  O(n logn)
def okay_two_sum?(arr, target)
  sorted_arr = arr.sort
  left = 0
  right = arr.length - 1

  while left < right
    sum = arr[left] + arr[right]
    return true if sum == target
    left += 1 if sum < target
    right -= 1 if sum > target
  end

  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

# O(n)
def two_sum?(arr, target)
  complements = {}

  arr.each do |num|
    return true if complements[target - num]
    complements[num] = true
  end

  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false