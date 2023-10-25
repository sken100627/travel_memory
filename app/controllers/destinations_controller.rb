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

  end

  private

  def destination_params
    params.require(:destination).permit(:place, :address, :image).merge(user_id: current_user.id)
  end

end
