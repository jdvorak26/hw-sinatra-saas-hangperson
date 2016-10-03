class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

#  def initialize()
 # end
 
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :guess
  attr_accessor :wrong_guesses
  
  def initialize(word)
    @word = word
    @guess = guess
    @guesses = ''
    @wrong_guesses = ''
  end
  
  #def guess
    
  #end
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
