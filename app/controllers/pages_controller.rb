class PagesController < ApplicationController
  def home
		@word = Word.last
	  @title = "Home"
	end

  def contact
	  @title = "Contact"
  end

  def about
	  @title = "About"
  end

end
