class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

#  def initialize()
 # end
 
  attr_accessor :word, :guesses, :wrong_guesses, :word_with_guesses, :check_win_or_lose
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @check_win_or_lose = :play
    @word_with_guesses = '-' * word.length
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
          for i in 0...@word.length
            if @word[i] == letter && @word_with_guesses[i] = '-'
              @word_with_guesses[i] = letter 
            end
          end
        check_end('win?')
          
      else
        @wrong_guesses << letter
        check_end('lose?')
      end
    else
      return false
    end
  end
  
  def check_end(type)
    if type == 'win?'
      for i in 0..@word.length-1
        if @word_with_guesses[i] == '-'
          return
        end
      end
      @check_win_or_lose = :win
    else
      if @wrong_guesses.length >= 7
        @check_win_or_lose =:lose
      end
    end
  end
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
end
