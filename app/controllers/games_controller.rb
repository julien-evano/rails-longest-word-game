require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)].capitalize }
  end

  def score
    answer = params["answer"]
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    english_word = open(url).read
    @validation = JSON.parse(english_word)
    session[:score] ||= 0
  end
end
