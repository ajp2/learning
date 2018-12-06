# check solutions/time complexity

# O(n!)
def first_anagram?(word, anagrams = [])
  return [word] if word.length == 1

  word.each_char do |letter|
    rest = word.delete(letter)

    result = first_anagram?(rest)

    result.each do |anagram|
      anagrams << letter + anagram
    end
  end

  anagrams
end

# p first_anagram?("elvis")

def anagram?(word, target)
  first_anagram?(word).include?(target)
end

# p anagram?("permutation", "lives")
# p anagram?("gizmo", "sally")


# O(nlog n) ?
def second_anagram?(word, target)
  target = target.split("")

  word.each_char do |letter|
    idx = target.find_index(letter)
    target.delete_at(idx) if idx
  end

  target.empty?
end

# p second_anagram?("elvis", "lives")
# p second_anagram?("gizmo", "sally")

# O(nlog n) ?
def third_anagram?(word, target)
  word.chars.sort.join == target.chars.sort.join
end

# p third_anagram?("elvis", "lives")
# p third_anagram?("gizmo", "sally")

# O(n)
def fourth_anagram?(word, target)
  letters = Hash.new(0)
  
  word.each_char do |letter|
    letters[letter] += 1
  end

  target.each_char do |letter|
    letters[letter] -= 1
  end

  letters.values.all? { |val| val == 0 }
end

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")