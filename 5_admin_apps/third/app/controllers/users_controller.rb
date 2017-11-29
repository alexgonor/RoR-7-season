class UsersController < ApplicationController
  before_action :find_user, only: :show

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    redirect_to users_path
  end

  def show
  end

  def edit
  end

  def update
  end

private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
