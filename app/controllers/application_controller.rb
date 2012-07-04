class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required

  helper_method :current_user, :logged_in?

  def login_required
  	if session[:user_id] 
  		@current_user = User.find_by_id(params[:id])
  	else
  		redirect_to login_path
  	end
  end

  def current_user
  	current_user ||= @current_user
  end

  def logged_in?
  	!!current_user
  end
end
