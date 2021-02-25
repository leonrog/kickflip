class UsersController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :photo)
  end
end
