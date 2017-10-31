class EnginesController < ApplicationController
  before_action :find_engine, only: [:show, :edit, :update, :destroy]

  def index
    @engines = Engine.all
  end

  def show
  end

  def new
    @engine = Engine.new
  end

  def edit
  end

  def create
    @engine = Engine.new(engine_params)

    if @engine.save
      redirect_to @engine
    else
      render 'new'
    end
  end

  def update
    if @engine.update(engine_params)
      redirect_to @engine
    else
      render 'edit'
    end
  end

  def destroy
    @engine.destroy

    redirect_to engines_path
  end

  private

  def find_engine
    @engine = Engine.find(params[:id])
  end

  def engine_params
    params.require(:engine).permit(:capasity, :power)
  end
end
