class TwitterController < ApplicationController

	def prepare_access_token(oauth_token, oauth_token_secret)
  	consumer = OAuth::Consumer.new("laHbZLaY5KmkiEPTuP1JWw", "XVcRARDRBSeVQX2hF0zkXmKzYBVhWOJyZ2qHXlkQU",
    {
    	:site => "http://api.twitter.com"
    })
    # now create the access token object from passed values
    token_hash =
    {
      :oauth_token => oauth_token,
    	:oauth_token_secret => oauth_token_secret
    }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    return access_token
	end

	def tweet
		# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
    @access_token = prepare_access_token(current_user.token, current_user.secret)

		@response = @access_token.request(:post, "http://api.twitter.com/statuses/update.json", :status => "Tweet pela API")
				
		render :text => @response.body.to_yaml
	end

end
