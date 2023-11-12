class DeparturesController < ApplicationController
  def index
    @distance = Geocoder::Calculations.distance_between([destination.latitude,destination.longitude],[departure.latitude,departure.longitude]).round
  end

  def new
    @departure = Departure.new
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
    params.require(:departure).permit(:spot, :location).merge(user_id: current_user.id)
  end
end
