class UsersController < ApplicationController
  before_action :find_user

  def create
    @user.create(user_params)
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
