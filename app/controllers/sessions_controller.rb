class SessionsController < ApplicationController

  def new
    # default: render 'new' template for session--i.e. login screen
  end

  def create
    user = User.find_by_user_id(params[:user][:user_id])
    if user && user.email==params[:user][:email]
     session[:session_token]=user.session_token
      redirect_to movies_path
    else  
      flash[:warning] = 'Invalid user-id/e-mail combination'
      redirect_to login_path
    end  
  end

  def destroy
    reset_session
    redirect_to movies_path
  end  

end
