class WordsController < ApplicationController
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
