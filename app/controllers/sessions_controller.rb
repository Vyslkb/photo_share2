class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && User.authenticate(params[:email], params[:password])
      flash[:notice] = "Successfully logged in"
      session[:user_id] = @user.id
      redirect_to "/"
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


# @user = User.authenticate(params[:email], params[:password])
# if @user
#   flash[:notice] = "You've been logged in."
#   session[:user_id] = @user.id
#   redirect_to "/"
# else
#   flash[:alert] = "There was a problem logging you in."
#   redirect_to log_in_path
# end
