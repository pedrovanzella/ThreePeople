class ApplicationController < ActionController::Base
  protect_from_forgery 
  helper_method :all
    
  private
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end

	def login_required
		if session[:user_id].nil?
			redirect_to :back rescue redirect_to root_path
		end
	end
end
