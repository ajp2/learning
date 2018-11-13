class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    selected = []

    self.my_each do |ele|
      selected << ele if prc.call(ele)
    end

    selected
  end

  def my_reject(&prc)
    selected = []

    self.my_each do |ele|
      selected << ele unless prc.call(ele)
    end

    selected
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false unless prc.call(ele)
    end
    true
  end

  def my_flatten(result = [])

    self.my_each do |ele|
      if ele.kind_of?(Array)
        ele.my_flatten(result)
      else
        result << ele
      end
    end

    result
  end

  def my_zip(*args)
    zipped_arr = []
    self.length.times do |n|
      inner_arr = [self[n]]

      args.each do |arg|
        if arg[n]
          inner_arr << arg[n]
        else
          inner_arr << nil
        end
      end

      zipped_arr << inner_arr
    end
    
    zipped_arr
  end

  def my_rotate(rotations = 1)
    rotated_arr = self.dup

    rotations = rotations % self.length
    rotations.times do |n|
      rotated_arr.push(rotated_arr.shift)
    end

    rotated_arr
  end

  def my_join(str = "")
    joined_str = ""

    self.each_with_index do |ele, idx|
      joined_str << ele
      joined_str << str unless idx == self.length - 1
    end

    joined_str
  end

  def my_reverse
    return self if self.length < 2

    reversed_arr = []
    self.my_each do |ele|
      reversed_arr.unshift(ele)
    end

    reversed_arr
  end
end