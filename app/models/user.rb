class User < ActiveRecord::Base
  has_many :favorites
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.username = auth['info']['username'] || ""
      end
    end
  end
end
