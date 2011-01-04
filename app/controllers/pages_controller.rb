class PagesController < ApplicationController
  def home
		@word = Word.first
	  @title = "Home"
	end

  def contact
	  @title = "Contact"
  end

  def about
	  @title = "About"
  end

end
