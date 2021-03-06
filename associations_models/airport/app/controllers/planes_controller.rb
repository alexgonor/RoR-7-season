class PlanesController < ApplicationController
  before_action :find_flight
  before_action :find_plane, only: %i[show edit update]

  def index
    @planes = @flight.planes.paginate(page: params[:page])
  end

  def new
    @plane = @flight.planes.new
    @plane.countries.build
  end

  def show; end

  def create
    @plane = @flight.planes.create(plane_params)
    redirect_to flight_planes_path(@flight)
  end

  def edit; end

  def update
    if @plane.update(plane_params)
      redirect_to flight_plane_path
    else
      render 'edit'
    end
  end

  # def destroy
  #   if current_model.admin?
  #     @plane.destroy
  #     redirect_to flight_planes_path
  #   end
  # end

  private

  def plane_params
    params.require(:plane).permit(:model, :max_speed, :avatar, countries_attributes: [:name])
  end

  def find_flight
    @flight = Flight.find(params[:flight_id])
  end

  def find_plane
    @plane = @flight.planes.find(params[:id])
  end
end
