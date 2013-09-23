class SessionController < ApplicationController

  def new 
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error = "Whatchu talkin bout, Willis?"
      redirect_to :back
    end
  end

  def destroy
  	session.clear
  	redirect_to '/'
  end

end