require "set"

class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.new(dictionary_file_name).readlines.map(&:chomp).to_set
  end

  def adjacent_words(word)
    alphabet = ("a".."z").to_a
    adjacent_words_arr = []

    word.each_char.with_index do |char, idx|
      alphabet.each do |letter|
        new_word = word[0...idx] + letter + word[idx+1..-1]
        next if new_word == word

        in_dict = @dictionary.include?(new_word)
        adjacent_words_arr << new_word if in_dict && !adjacent_words_arr.include?(new_word)
      end
    end

    adjacent_words_arr
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|

        next if @all_seen_words.include?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
    end

    @current_words = new_current_words
  end

  def build_path(target)
    current_word = target
    path = []
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end

    path.reverse
  end
end

if $PROGRAM_NAME == __FILE__
  word = WordChainer.new("dictionary.txt")
  p word.run("duck", "stub")
end