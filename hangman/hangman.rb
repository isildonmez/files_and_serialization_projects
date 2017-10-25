class Hangman
  def initialize()
    @secret_word = ""
    create_secret_code
  end

  def create_secret_code
    dictionary = File.readlines("5desk.txt")
    # p dictionary
    sample_word = dictionary.sample
    puts sample_word
    until sample_word.length.between?(5, 12)
      sample_word = dictionary.sample
      puts sample_word
    end
    @secret_word = sample_word
    puts @secret_word
  end

end

game = Hangman.new

#  ___
#  | \|
#  O  |
# /|\ |
#  |  |
# / \ |
#   __|_


