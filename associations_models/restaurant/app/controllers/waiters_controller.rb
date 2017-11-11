class WaitersController < ApplicationController

  def index
    @waiters = Waiter.all
  end

  def new
    @waiter = @cook.waiters.new
  end

  def show
  end

  def create
    @waiter =@cook.waiters.create(waiter_params)
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
end
