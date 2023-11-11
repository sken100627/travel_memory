class DeparturesController < ApplicationController
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
    params.require(:departure).permit(:place, :address).merge(user_id: current_user.id)
  end
end
