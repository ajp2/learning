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