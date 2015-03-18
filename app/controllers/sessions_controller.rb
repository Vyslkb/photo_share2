class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && User.authenticate(params[:email], params[:password])
      flash[:notice] = "Successfully logged in"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "User name or password entered incorrectly."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end

end
