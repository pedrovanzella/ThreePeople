class TwitterController < ApplicationController
	def tweet
		Twitter.configure do |config|
		  config.consumer_key = "laHbZLaY5KmkiEPTuP1JWw"
		  config.consumer_secret = "XVcRARDRBSeVQX2hF0zkXmKzYBVhWOJyZ2qHXlkQU"
		  config.oauth_token = current_user.token
		  config.oauth_token_secret = current_user.secret
		end
		
		client = Twitter::Client.new
		client.update("")
		
	end

end
