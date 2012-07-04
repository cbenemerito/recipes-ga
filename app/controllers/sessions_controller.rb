
class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
  end

  def create
  	@user = User.find_by_email_address(params[:email_address])

  	session[:user_id] = @user.id

  	if @user.authenticate(params[:password])
  		redirect_to users_path
  	else
  		render :action => 'new', :notice => 'you entered an invalid password'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path
  end
end
