class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def new
    @destination_departure = DestinationDeparture.new
  end

  def create
    @destination_departure = DestinationDeparture.new(destination_params)
    if @destination_departure.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @destination = Destination.find(params[:id])
    @record = @destination.record
  end

  def edit
    @destination = Destination.find(params[:id])
    @departure = Departure.find_by(destination_id: @destination.id)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def destination_params
    params.require(:destination_departure).permit(:place, :address, :image, :start_date, :end_date, :spot, :location).merge(user_id: current_user.id)
  end

end
