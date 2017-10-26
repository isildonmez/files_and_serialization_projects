class Hangman
  def initialize()
    @secret_word = ""
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

  def create_secret_code
    dictionary = File.readlines("5desk.txt")
    sample_word = dictionary.sample
    until sample_word.length.between?(5, 12)
      sample_word = dictionary.sample
    end
    @secret_word = sample_word.downcase
  end

  def get_the_guess
  end

  def print_wrong_guesses
  end

  def print_how_many_guesses_remain
  end

  def compare_the_guess
  end

  def visualise_the_word
  	compare_the_guess
  end

  def draw_a_hangman
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
  	while @mistaken_letters.size < 7
      get_the_guess
      draw_a_hangman
      visualise_the_word
      print_wrong_guesses
      print_how_many_guesses_remain
    end
  end

end

game = Hangman.new


