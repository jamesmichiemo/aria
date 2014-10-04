require 'json'

class TracksController < ApplicationController
  def index
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>'http://localhost:3000'})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @tracks = JSON.parse(@accesstoken.get('https://oauth-api.beatport.com/catalog/3/most-popular').body)
  end
end