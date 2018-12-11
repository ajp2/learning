class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    acc = self[0] || 0
    (1...self.length).each do |idx|
      acc = acc ^ (self[idx] + idx)
    end
    acc.hash
  end
end

class String
  def hash
    self.chars.map { |char| char.ord }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_arr = self.entries.flatten.map do |val|
      if val.is_a?(Integer)
        val
      else
        val.to_s.ord
      end
    end
    hash_arr.sort.hash
  end
end
