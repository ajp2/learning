def factors(num)
  factors_of_num = []

  (1..num).each do |factor|
    factors_of_num << factor if num % factor == 0
  end

  factors_of_num
end

# p factors(1) # [1]
# p factors(2) # [1,2]
# p factors(10) # [1,2,5,10]

class Array
  def bubble_sort!(&prc)
    unsorted = true

    while unsorted
      unsorted = false
      self.each_with_index do |ele, idx|

        if block_given?
          if idx < self.length - 1 && prc.call(ele, self[idx+1]) == 1
            self[idx], self[idx+1] = self[idx+1], self[idx]
            unsorted = true
          end
        else
          if idx < self.length - 1 && ele > self[idx+1]
            self[idx], self[idx+1] = self[idx+1], self[idx]
            unsorted = true
          end
        end
        
      end
    end

    self
  end

  def bubble_sort(&prc)
    copy_of_arr = self.dup
    copy_of_arr.bubble_sort!(&prc)
  end
end

# p [3,2,1].bubble_sort # [1,2,3]
# p [1,5,2,8,4].bubble_sort # [1,2,4,5,8]

# p [1, 3, 5].bubble_sort { |num1, num2| num1 <=> num2 } #sort ascending
# p [1, 3, 5].bubble_sort { |num1, num2| num2 <=> num1 } #sort descending


def substrings(string)
  list_of_substrings = []

  string.each_char.with_index do |ele1, idx1|
    list_of_substrings << ele1
    string.each_char.with_index do |ele2, idx2|
      if idx2 > idx1
        list_of_substrings << string[idx1..idx2]
      end
    end
  end

  list_of_substrings
end

# p substrings("cat") # ["c", "ca", "cat", "a", "at", "t"]

def subwords(word, dictionary)
  list_of_substrings = substrings(word)
  list_of_substrings.select { |substring| dictionary.include?(substring) }
end

# p subwords("cat", ["random", "cat", "a", "at", "other", "words"]) # ["cat", "a", "at"]