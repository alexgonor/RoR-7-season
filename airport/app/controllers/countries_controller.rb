class CountriesController < ApplicationController
  before_action :find_flight
  before_action :find_plane
  before_action :find_country, only: [:show, :edit, :update, :destroy]

  def index
    @countries = @plane.countries
  end

  def new
    @country = @plane.countries.new
  end

  def show
  end

  def create
    @country = @plane.countries.create(country_params)
    redirect_to flight_plane_country_path(@flight, @plane, @country)
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to flight_plane_country_path
    else
      render 'edit'
    end
  end

  def destroy
    @country.destroy
    redirect_to flight_plane_countries_path
  end

  private

  def find_flight
    @flight = Flight.find(params[:flight_id])
  end

  def find_plane
    @plane = @flight.planes.find(params[:plane_id])
  end

  def find_country
    @country = @plane.countries.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end
end
