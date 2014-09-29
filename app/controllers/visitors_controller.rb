class VisitorsController < ApplicationController
  def index
    @consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>'http://localhost:3000'})
    @accesstoken = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])

  end
end
