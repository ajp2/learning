require "set"

class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.new(dictionary_file_name).readlines.map(&:chomp).to_set
  end

  def adjacent_words(word)
    adjacent_words_arr = []
    word.each_char.with_index do |char, idx|
      
    end
  end
end

a = WordChainer.new("dictionary.txt")
p a.adjacent_words("cat") # ["mat", "fat", "bat", "can"] etc