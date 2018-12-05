FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  longest_fish = nil

  fish.each do |ele1|
    fish.each do |ele2|
      longest_fish = ele1 if ele1.length > ele2.length
    end
  end

  longest_fish
end

def dominant_octopus(fish)
  return fish if fish.length == 1

  mid = fish.length / 2
  left = dominant_octopus(fish[0...mid])
  right = dominant_octopus(fish[mid..-1])

  def merge_sort(left, right)
    merged_arr = []

    until left.empty? && right.empty?
      if left.empty?
        merged_arr << right.shift
      elsif right.empty?
        merged_arr << left.shift
      elsif left[0].length < right[0].length
        merged_arr << left.shift
      else
        merged_arr << right.shift
      end
    end

    merged_arr
  end

  merge_sort(left, right)
end

def clever_octopus(fish)
  longest_fish_length = 0
  longest_fish = nil

  fish.each do |ele|
    if ele.length > longest_fish_length
      longest_fish_length = ele.length
      longest_fish = ele
    end
  end

  longest_fish
end

# p sluggish_octopus(FISH)
# p clever_octopus(FISH)
# p dominant_octopus(FISH)[-1]

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ]

def slow_dance(dir, tiles_arr)
  tiles_arr.each_with_index do |tile, idx|
    return idx if dir == tile
  end
end

tiles = {"up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)
# p fast_dance("up", tiles)
# p fast_dance("right-down", tiles)