def range_iterative(start, ending)
  nums_arr = []
  (start...ending).each do |n|
    nums_arr << n
  end
  nums_arr
end

def range_recursive(start, ending)
  return [] if ending < start
  return [start] if start -1 == ending
  [start] + range_recursive(start+1, ending)
end

def exponentiation_1(base, power)
  return 1 if power == 0
  base * exponentiation_1(base, power - 1)
end

def exponentiation_2(base, power)
  return 1 if power == 0
  if power.even?
    even_val = exponentiation_2(base, power/2)
    even_val * even_val
  else
    odd_val = exponentiation_2(base, (power - 1) / 2)
    base * odd_val * odd_val
  end
end

class Array
  def deep_dup
    copied_arr = []
    self.each do |ele|
      if !ele.is_a?(Array)
        copied_arr << ele
      else
        copied_arr << ele.deep_dup
      end
    end

    copied_arr
  end
end

def fibonacci_iterative(n)
  return nil if n < 0
  return [0] if n == 0
  return [0, 1] if n == 1

  sequence = [0, 1]
  (2..n).each do |num|
    sequence << sequence[num-1] + sequence[num-2]
  end

  sequence
end

def fibonacci_recursive(n)
  return nil if n < 0
  return [0] if n == 0
  return [0, 1] if n == 1

  fib_arr = fibonacci_recursive(n-1)
  fib_arr << fib_arr[-1] + fib_arr[-2]
end

def bsearch(arr, target, low = 0, high = nil)
  high = arr.length - 1 if high == nil
  mid = low + (high - low) / 2
  return nil if low > high
  location = target <=> arr[mid]

  if location == 0
    return mid
  elsif location == -1
    return bsearch(arr, target, low, mid - 1)
  else
    return bsearch(arr, target, mid+1, high)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1

  middle = arr.length / 2
  sorted_left = merge_sort(arr[0...middle])
  sorted_right = merge_sort(arr[middle..-1])
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged_arr = []
  loop do
    break if left[0].nil? && right[0].nil?
    if left[0].nil?
      merged_arr << right.shift
      next
    elsif right[0].nil?
      merged_arr << left.shift
      next
    end

    if left[0] <= right[0]
      merged_arr << left.shift
    else
      merged_arr << right.shift
    end
  end
  merged_arr
end

def subsets(arr)
  return [arr] if arr.length == 0

  new_arr = arr.dup
  last_val = new_arr.pop
  initial_subsets = subsets(new_arr)

  new_subsets = []
  initial_subsets.each { |subset| new_subsets << subset + [last_val]}
  
  return initial_subsets + new_subsets
end

def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift
  perms = permutations(arr)

  total_permutations = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_permutations
end

def make_change(target, coins = [25, 10, 5, 1])
  return [] if target == 0
  return nil if coins.none? { |coin| coin <= target }

  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target
    remainder = target - coin

    best_remainder = make_change(remainder, coins.drop(index))
    next if best_change.nil?
    this_change = [coin] + best_remainder

    if best_change.nil? || (this_change.count < best_change.count)
      best_change = this_change
    end
  end

  best_change
end