class DeparturesController < ApplicationController

  def show
    destination = Destination.find(params[:destination_id])
    departure = Departure.find(params[:id])

    @distance = Geocoder::Calculations.distance_between([destination.latitude,destination.longitude],[departure.latitude,departure.longitude]).round

  end

  def new
    @departure = Departure.new
    @destination = Destination.find(params[:destination_id])
  end

  def create
    @departure = Departure.new(departure_params)
    if @departure.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def departure_params
    params.require(:departure).permit(:spot, :location).merge(user_id: current_user.id, destination_id: params[:destination_id])
  end
end
