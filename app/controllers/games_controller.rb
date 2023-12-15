require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    for i in 0..9 do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @result = " "
    @resultat = params["word"].chars.all? { |lettre| params["letters"].include?(lettre) }
    @word = params["word"]
    
    url = "https://wagon-dictionary.herokuapp.com"
    finalUrl = "#{url}/#{@word}"
    @response = URI.open(finalUrl).read
    @data = JSON.parse(@response)
    @letters = params["letters"]



    if @data["found"] == true
    end


  end
end
