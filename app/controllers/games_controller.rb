require 'open-uri'

class GamesController < ApplicationController
  def new
    array = []
    alphabet = ('a'..'z').to_a
    9.times { array << alphabet[rand(26)] }
    @letters = array.join.upcase
  end

  def score
    @guess = params[:word]
    a_word?(@guess)
    in_grid?(@guess)
    raise
    # if a_word?(@guess) &&
  end

  def a_word?(guess)
    url = "https://wagon-dictionary.herokuapp.com/#{guess}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    user["found"]
  end

  def in_grid?(guess)
    guess.chars.all? do |letter|
      letter.upcase == new
    end
  end
end
