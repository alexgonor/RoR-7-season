class WorkersController < ApplicationController
  before_action :find_worker, only: [:show, :edit, :update, :destroy]

  def index
    @workers = Worker.all
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)

      if @worker.save
        redirect_to @worker
      else
        render 'new'
      end
  end

  def update
    if @worker.update(worker_params)
      redirect_to @worker
    else
      render 'edit'
    end
  end

  def destroy
    @worker.destroy

    redirect_to workers_path
  end

  private

    def worker_params
      params.require(:worker).permit(:name, :salary)
    end

    def find_worker
      @worker = Worker.find(params[:id])
    end
end
