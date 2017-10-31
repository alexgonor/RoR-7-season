class SoldersController < ApplicationController
  before_action :find_solder, only: [:show, :edit, :update, :destroy]

  def index
    @solders = Solder.all
  end

  def new
    @solder = Solder.new
  end

  def edit
  end

  def create
    @solder = Solder.new(solder_params)

    if @solder.save
      redirect_to @solder
    else
      render 'new'
    end
  end

  def update
    if @solder.update(solder_params)
      redirect_to @solder
    else
      render 'edit'
    end
  end

  def destroy
    @solder.destroy
    redirect_to solders_path
  end

  private

  def find_solder
    @solder = Solder.find(params[:id])
  end

  def solder_params
    params.require(:solder).permit(:rank, :specialization)
  end
end
