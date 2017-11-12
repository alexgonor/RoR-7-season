class WaitersController < ApplicationController
  before_action :find_cook
  before_action :find_waiter, only: [:show, :edit, :update, :destroy]

  def index
    @waiters = @cook.waiters.paginate(:page => params[:page])
  end

  def new
    @waiter = @cook.waiters.new
  end

  def show
  end

  def create
    @waiter = @cook.waiters.create(waiter_params)
    redirect_to cook_waiters_path(@cook)
  end

  def edit
  end

  def update
    if @waiter.update(waiter_params)
      redirect_to cook_waiter_path
    else
      render 'edit'
    end
  end

  def destroy
    @waiter.destroy
    redirect_to cook_waiters_path
  end

  private

  def find_cook
    @cook = Cook.find(params[:cook_id])
  end

  def find_waiter
    @waiter = @cook.waiters.find(params[:id])
  end

  def waiter_params
    params.require(:waiter).permit(:name, :avatar)
  end
end
