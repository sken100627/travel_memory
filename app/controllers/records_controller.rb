class RecordsController < ApplicationController
  def new
    @destination = Destination.find(params[:destination_id])
    @record = Record.new
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @record = Record.new(record_params)
    if @record.save
      redirect_to destination_path(@destination.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @destination = Destination.find(params[:destination_id])
    @record = Record.find(params[:id])
  end

  private

  def record_params
    params.require(:record).permit(:gasoline_cost, :accommondation_fee, :express_fee, :total, :food_expenses).merge(user_id: current_user.id, destination_id: params[:destination_id])
  end


end
