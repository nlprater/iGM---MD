class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)

	if @user.save
	  session[:user_id] = @user.id
	  redirect_to '/draft'
	else
	  @error = "You messed up, sucka!"
	  redirect_to :back
	end 
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end