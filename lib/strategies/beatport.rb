require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Beatport < OmniAuth::Strategies::OAuth
      args [:consumer_key, :consumer_secret]
      option :name, "beatport"
      option :fields, [:username, :password]
      option :uid_field, :username
      option :client_options, {
        :site               => 'https://oauth-api.beatport.com',
        :authorize_path      => '/identity/1/oauth/authorize?oauth_token=abcdef',
        :request_token_path  => '/identity/1/oauth/request-token',
        :access_token_path   => '/identity/1/oauth/access-token'
      }
      uid { raw_info['id'] }
      info do
        {
          'name' => "#{raw_info['first_name']} #{raw_info['last_name']}",
          'email' => raw_info['register_email_address'],
          'username' => raw_info['username'],
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info["last_name"]
        }
      end
      extra do
        { 'raw_info' => raw_info }
      end
      # def request_phase
      #   #redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(options.authorize_params))
      #   redirect 'https://oauth-api.beatport.com/identity/1/oauth/authorize?oauth_token=abcdef'
      # end
      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/identity/1/person').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end
