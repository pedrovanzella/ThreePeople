class User < ActiveRecord::Base
	def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]  
      user.name = auth["user_info"]["name"] 
      user.token => omniauth['credentials']['token'],
      user.secret => omniauth['credentials']['secret'] 
    end  
  end  
end
