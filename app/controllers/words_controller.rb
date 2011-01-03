class WordsController < ApplicationController
  def index
		@title = "Latest"
    @words = Word.all
  end

  def new
  	if @@client.authorized?
  		@@access_token = client.authorize(
  			@@request_token.token,
  			@@request_token.secret,
  			:oauth_verifier => params[:oauth_verifier]
			)
			@username = @@client.info["name"]
		end
  
		@title = "New Definition"
    @word = Word.new
  end

  def create
    @word = Word.new(params[:word])
    if @word.save
      flash[:notice] = "Successfully created word."
      redirect_to @word
    else
      render :action => 'new'
    end
  end

  def show
    @word = Word.find(params[:id])
  end
end
