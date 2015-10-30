class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end

  def new
    # default: render 'new' template for user
  end

  def create
    if User.find_by_user_id(params[:user][:user_id])
      flash[:notice]= "Sorry, this user-id is taken.  Try again."
      redirect_to new_user_path
    else   
      @user = User.create_user!(user_params)
      flash[:notice] = "#{@user.user_id} was successfully created."
      redirect_to login_path
    end  
  end

end
