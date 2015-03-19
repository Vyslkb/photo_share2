class UserAvatarsController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.avatar = nil
    @user.save
    flash[:alert] = "Avatar Destroyed!"
    redirect_to user_path(@user)
  end
end
