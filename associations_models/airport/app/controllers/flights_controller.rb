class FlightsController < ApplicationController
  before_action :find_flight, only: %i[show edit update destroy]

  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end

  def show; end

  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to @flight
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @flight.update(flight_params)
      redirect_to @flight
    else
      render 'edit'
    end
  end

  def destroy
    @flight.destroy
    redirect_to flights_path
  end

  private

  def flight_params
    params.require(:flight).permit(:bord_number, :passengers_count)
  end

  def find_flight
    @flight = Flight.find(params[:id])
  end
end
