class Hangman
  def initialize()
    @mistaken_letters = []

    welcoming
    act
  end

  # TODO: IF SAVED GAME
  def welcoming
  	puts "Welcome to Hangman"
  	# If not saved game
  	puts "You can make at most 5 wrong guesses to find out the secret word."
  	draw_a_hangman
  end

  # TODO: the type of the secret_word
  def create_secret_code
    dictionary = File.readlines("5desk.txt")
    sample_word = dictionary.sample.strip
    until sample_word.length.between?(5, 12)
      sample_word = dictionary.sample.strip
    end
    @secret_word = sample_word.downcase
    p @secret_word
  end

  def get_the_guess
    puts "Make a guess:"
    @guess = gets.chomp.downcase
    # all_letters = @guess.ord.between?(97, 122)
    # one_letter = @guess[1].nil?
    # old_@guess = @mistaken_letters.include? @guess

    until @guess.ord.between?(97, 122) &&
          @guess[1].nil? &&
          !(@mistaken_letters.include? @guess)
      puts "Please make a new and valid @guess"
      @guess = gets.chomp.downcase
    end
    @guess
  end

  def analyse_the_guess
  	if @secret_word.include? @guess
  	  visualise_the_word
  	else
  	  draw_a_hangman
      @mistaken_letters << @guess
  	end
  end

  def how_many_guesses_remain
  	case @mistaken_letters.size
  	  when 6
  	  	puts "You don't have any guesses remain"
  	  when 5
  	    puts "You shouldn't make a wrong guess to win"
  	  when 4
  	  	puts "You have #{5 - @mistaken_letters.size} guess remain for your wrong guesses."
  	  else
  	    puts "You have #{5 - @mistaken_letters.size} guesses remain for your wrong guesses."
  	end
  end

  def wrong_guesses
  	if @mistaken_letters.empty?
  	  puts "You don't have any wrong guesses so far"
  	else
  	  puts "Wrong guesses so far: #{@mistaken_letters.join(", ")}"
  	end
  end

  def visualise_the_word

  	@visualised_word = "visualised the word test"
  end

  def draw_a_hangman
	#  ___
	#  | \|
	#  O  |
	# /|\ |
	#  |  |
	# / \ |
	#   __|_
	@drawn_hangman = "drew the hangman test"
  end

  def act
  	  create_secret_code
  	  puts "#{@secret_word.length.times {print "- "}}"
  	until (@mistaken_letters.size == 6) ||
           (@visualised_word == @secret_word)
      get_the_guess
      analyse_the_guess
      puts @drawn_hangman
      wrong_guesses
	  how_many_guesses_remain
      puts @visualised_word
    end
    puts "Game over" if @mistaken_letters.size == 6
    puts "Congratulations" if @visualised_word == @secret_word
  end

end

game = Hangman.new


