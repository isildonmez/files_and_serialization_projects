class Hangman
  def initialize()
    @mistaken_letters = []
    @right_guesses = " "
    @drawing_array = ["  ___", "  | \\|", "     |", "     |", "     |", "     |", "   __|_"]

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

    until @guess.ord.between?(97, 122) &&
          @guess.size == 1 &&
          !(@mistaken_letters.include? @guess)
      puts "Please make a new and valid guess"
      @guess = gets.chomp.downcase
    end
    @guess
  end

  def analyse_the_guess
  	if @secret_word.include? @guess
      @right_guesses += @guess
  	  visualise_the_word
  	else
      @mistaken_letters << @guess
      draw_a_hangman
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
    @visualised_word = @secret_word.tr("^#{@right_guesses}", "-")
    p @visualised_word
  end

  def draw_a_hangman
    case @mistaken_letters.size
      when 1
        @drawing_array[2][2] = "O"
      when 2
        @drawing_array[3][2] = "|"
        @drawing_array[4][2] = "|"
      when 3
        @drawing_array[3][1] = "/"
      when 4
        @drawing_array[3][3] = "\\"
      when 5
        @drawing_array[5][1] = "/"
      when 6
        @drawing_array[5][3] = "\\"
    end
    @drawn_hangman = @drawing_array.join("\n")
  # def draw_a_hangman(wrong_guesses)
  #   body = ['O', '|', '/', '\\', '/','\\']
  #   template =
  #     " __\n"\
  #     " | \\|\n"\
  #     " %1$s  |\n"\
  #     "%3$s%2$s%4$s |\n"\
  #     " %2$s  |\n"\
  #     "%5$s %6$s |\n"\
  #     "  __|"
  #   current_body = body.first(wrong_guesses) + [" "] * (body.size - wrong_guesses)
  #   return template % current_body
  # end

	#  ___
	#  | \|
	#  O  |
	# /|\ |
	#  |  |
	# / \ |
	#   __|_
  end

  def act
  	  create_secret_code
      puts @visualised_word
  	until (@mistaken_letters.size == 6) ||
          (@visualised_word == @secret_word)
      get_the_guess
      analyse_the_guess
      puts @visualised_word
      puts @drawn_hangman
      wrong_guesses
	    how_many_guesses_remain
    end
    puts @secret_word.upcase
    puts "Game over" if @mistaken_letters.size == 6
    puts "Congratulations" if @visualised_word == @secret_word
  end

end

game = Hangman.new


