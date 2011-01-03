@@twitter_config = YAML.load_file("config/twitter.yml") rescue nil || {}
  
@@client = TwitterOAuth::Client.new(
	:consumer_key => @@twitter_config['consumer_key'],
	:consumer_secret => @@twitter_config['consumer_secret'],
)
  	
@@rate_limit_status = @@client.rate_limit_status
  	
@@request_token = @@client.request_token(:oauth_callback => oauth_confirm_url)
  	
@@request_token.authorize_url => https://api.twitter.com/oauth/authorize
