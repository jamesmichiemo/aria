require 'json'

class TracksController < ApplicationController
  def index
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>ENV['OAUTH_CONSUMER_SITE']})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @tracks = JSON.parse(@accesstoken.get('https://oauth-api.beatport.com/catalog/3/most-popular').body)
    @results = Kaminari.paginate_array(@tracks["results"].to_a).page(params[:page]).per(10)
    redirect_to :welcome_index unless user_signed_in? 
  end

  def search
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>ENV['OAUTH_CONSUMER_SITE']})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @tracks = JSON.parse(@accesstoken.get("https://oauth-api.beatport.com/catalog/3/search/?query=#{URI.encode(params[:query])}&perPage=150").body)
    @results = Kaminari.paginate_array(@tracks["results"].to_a.delete_if {|key, value| key["type"] !="track" }).page(params[:page]).per(15)
    render 'index'
  end

  def show
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>ENV['OAUTH_CONSUMER_SITE']})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    @similar_tracks = JSON.parse(@accesstoken.get("https://oauth-api.beatport.com/catalog/3/tracks/similar?id=#{URI.encode(params[:id])}&perPage=20").body)
    @affinite_results = Kaminari.paginate_array(@similar_tracks["results"].to_a.delete_if {|key, value| key["type"] !="track" }).page(params[:page]).per(15)
    @track_key = params[:key]
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end
end

