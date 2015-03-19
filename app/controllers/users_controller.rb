class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the site!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update # parameters should look like { :user => { :avatar => nil } }
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have successfully updated #{@user.email}!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      flash[:alert] = "Account destroyed!"
      redirect_to '/'
    else
      flash[:alert] = "There was a problem deleting your account. Please try again."
      redirect_to '/'
    end
  end




  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end

end
