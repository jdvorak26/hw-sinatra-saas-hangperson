class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

#  def initialize()
 # end
 
  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def guess(letter)
    
    if letter !~ /[a-z]/i || letter == nil || letter.empty?
      raise ArgumentError
    end
    
    #is case insensitive
    letter = letter.downcase
    
    if !@guesses.include? letter and !@wrong_guesses.include? letter
      if @word.include? letter
        @guesses << letter
      else
        @wrong_guesses << letter
      end
    else
      return false
    end
  
  end
  
  def word_with_guesses
    
    @guesses.each_char do |i|
      
      if @word.include? i
        word.gsub(/[a-z]/i , i)
      else 
        word.gsub(/[a-z]/i , '-')
      end
    return word
    end
  end
  
  
  def check_win_or_lose
    if @guesses.length == @word.length
      :win
    elsif @wrong_guesses.length >= 7
      :lose
    else
      :play
    end
  end
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
