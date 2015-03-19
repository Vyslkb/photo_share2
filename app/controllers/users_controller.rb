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

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have successfully updated #{@user.email}!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   flash[:notice] = "Account destroyed!"
  #   redirect_to '/'
  # end
  #
  #
  def destroy
    @user = User.find(params[:id])
    @user.avatar.destroy
    flash[:notice] = "Avatar destroyed!"
    redirect_to user_path(@user)
  end




  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end

end
