require 'json'

class TracksController < ApplicationController
  def index
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>ENV['OAUTH_CONSUMER_SITE']})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @tracks = JSON.parse(@accesstoken.get('https://oauth-api.beatport.com/catalog/3/most-popular').body)
  end

  def search
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>ENV['OAUTH_CONSUMER_SITE']})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @tracks = JSON.parse(@accesstoken.get("https://oauth-api.beatport.com/catalog/3/search/?query=#{URI.encode(params[:query])}").body)
    render 'index'
  end

  def show
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>ENV['OAUTH_CONSUMER_SITE']})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @tracks = JSON.parse(@accesstoken.get("https://oauth-api.beatport.com/catalog/3/tracks/similar?id=#{URI.encode(params[:id])}").body)
    @track_key = params[:key]
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end
end

