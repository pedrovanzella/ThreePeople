class TwitterController < ApplicationController

	def tweet
			def prepare_access_token(oauth_token, oauth_token_secret)
            consumer = OAuth::Consumer.new("laHbZLaY5KmkiEPTuP1JWw", "XVcRARDRBSeVQX2hF0zkXmKzYBVhWOJyZ2qHXlkQU",
                { :site => "http://api.twitter.com"
                })
            # now create the access token object from passed values
            token_hash = { :oauth_token => oauth_token,
                                         :oauth_token_secret => oauth_token_secret
                                     }
            access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
            return access_token
        end

        auth = current_user.authentications.find(:first, :conditions => { :provider => 'twitter' })

        # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
        access_token = prepare_access_token(auth['token'], auth['secret'])

				access_token.request(:post, "http://api.twitter.com/version/statuses/update.json", "Tweet pela API")
				
				render :json => response.body
	end

end
