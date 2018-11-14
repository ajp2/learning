class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment)
    puts "The current fragment is: #{fragment}"
    puts "Enter a letter " + @name
    guessed_letter = gets.chomp.downcase
  end

  def alert_invalid_guess
    puts "Your guess is invalid"
  end
end