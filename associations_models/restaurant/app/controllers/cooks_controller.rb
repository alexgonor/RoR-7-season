class CooksController < ApplicationController
  before_action :find_cook, only: [:show, :edit, :update, :destroy]

  def index
    @cooks = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def show
  end

  def create
    @cook = Cook.new(cook_params)

    if @cook.save
      redirect_to cooks_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @cook.update(cook_params)
      redirect_to @cook
    else
      render 'edit'
    end
  end

  def destroy
    @cook.destroy
    redirect_to cooks_path
  end

  private

  def cook_params
    params.require(:cook).permit(:name)
  end

  def find_cook
    @cook = Cook.find(params[:id])
  end
end
