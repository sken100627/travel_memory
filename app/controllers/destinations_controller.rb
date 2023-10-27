class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @destination = Destination.find(params[:id])
  end

  private

  def destination_params
    params.require(:destination).permit(:place, :address, :image, :start_date, :end_date).merge(user_id: current_user.id)
  end

end
