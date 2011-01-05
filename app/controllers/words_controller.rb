class WordsController < ApplicationController
	before_filter :login_required
	
  def index
		@title = "Latest"
    @words = Word.all
  end

  def new
  	@title = "New Definition"
    @word = Word.new
  end

  def create
    @word = Word.new(params[:word])
		
		@word.personone = params['word']['personone'].split(' ').join
		@word.persontwo = params['word']['persontwo'].split(' ').join
		@word.personone = params['word']['personthree'].split(' ').join
		
    if @word.save
      flash[:notice] = "Successfully created word."
			if params['follow']
				follow
			end
			if params['tweet']
				tweet(@word)
			end
      redirect_to @word
    else
      render :action => 'new'
    end
  end

  def show
    @word = Word.find(params[:id])
  end

private
	def follow
		Twitter.configure do |config|
		  config.consumer_key = "laHbZLaY5KmkiEPTuP1JWw"
		  config.consumer_secret = "XVcRARDRBSeVQX2hF0zkXmKzYBVhWOJyZ2qHXlkQU"
		  config.oauth_token = current_user.token
		  config.oauth_token_secret = current_user.secret
		end
		
		client = Twitter::Client.new
		begin
			client.follow('elland')
			client.follow('pedrovanzella')
		rescue
			
		end
	end


	def tweet(w)
		Twitter.configure do |config|
		  config.consumer_key = "laHbZLaY5KmkiEPTuP1JWw"
		  config.consumer_secret = "XVcRARDRBSeVQX2hF0zkXmKzYBVhWOJyZ2qHXlkQU"
		  config.oauth_token = current_user.token
		  config.oauth_token_secret = current_user.secret
		end
		
		client = Twitter::Client.new
		client.update("I just said @#{params['word']['personone']}, @#{params['word']['persontwo']} and @#{params['word']['personthree']} are all #{params['word']['name']}, at http://threepeople.me")
		
	end
end
