module OmniAuth
  module Strategies
    autoload :Beatport, Rails.root.join('lib', 'strategies', 'beatport')
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :Beatport, ENV["OMNIAUTH_PROVIDER_KEY"], ENV["OMNIAUTH_PROVIDER_SECRET"]
  provider :developer unless Rails.env.production?
end
