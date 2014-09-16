class SessionsController < ApplicationController
  def new
    redirect_to '/auth/beatport'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    # session[:access] = auth[:extra][:access_token]
    #@consumer = OAuth::Consumer.new(ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:site=>'http://localhost:3000'})
    # @callback_url = "http://localhost:3000/auth/beatport/callback"
    # @consumer=OAuth::Consumer.new ENV['OMNIAUTH_PROVIDER_KEY'],
    #                               ENV['OMNIAUTH_PROVIDER_SECRET'],
    #                               {:site=>'https://oauth-api.beatport.com'}
    #request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
    #@accesstoken = OAuth::AccessToken.new(@consumer, auth[:credentials][:token], auth[:credentials][:secret])
    # session[:access_token] = @request_token.get_access_token
    session[:token] = auth[:credentials][:token]
    session[:secret] = auth[:credentials][:secret]
    # session[:access] = OAuth::AccessToken.new(@consumer, session[:token], session[:secret])
    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
