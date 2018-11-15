def sum_to(num)
  return nil if num < 1
  return 1 if num == 1
  num + sum_to(num-1)
end

def add_numbers(nums_arr)
  return nil if nums_arr.length == 0
  return nums_arr[0] if nums_arr.length == 1
  nums_arr[0] + add_numbers(nums_arr[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavours, favourite)
  return flavours[0] == favourite if flavours.length <= 1
  if flavours[0] == favourite
    return true
  else
    ice_cream_shop(flavours[1..-1], favourite)
  end
end

def reverse(string)
  return string if string.length <= 1
  reverse(string[1..-1]) + string[0]
end