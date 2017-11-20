class Admin::SitiesController < Admin::ApplicationController
  before_action :find_flight, :find_plane, :find_country
  before_action :find_sity, only: %i[show edit update destroy]

  def index
    @sities = @country.sities
  end

  def new
    @sity = @country.sities.new
  end

  def show; end

  def create
    @sity = @country.sities.create(sity_params)
    redirect_to admin_flight_plane_country_sity_path(@flight, @plane, @country, @sity)
  end

  def edit; end

  def update
    if @sity.update(sity_params)
      redirect_to admin_flight_plane_country_sity_path
    else
      render 'edit'
    end
  end

  def destroy
    @sity.destroy
    redirect_to admin_flight_plane_country_sities_path
  end

  private

  def find_flight
    @flight = Flight.find(params[:flight_id])
  end

  def find_plane
    @plane = @flight.planes.find(params[:plane_id])
  end

  def find_country
    @country = @plane.countries.find(params[:country_id])
  end

  def find_sity
    @sity = @country.sities.find(params[:id])
  end

  def sity_params
    params.require(:sity).permit(:name)
  end
end
