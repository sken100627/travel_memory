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
    @records = @destination.record
    if @records.present?
      @record = Record.find(params[:id])
      @destination = Destination.find(params[:destination_id])
      @departure = Departure.find(params[:departure_id])

      @distance = Geocoder::Calculations.distance_between([@destination.latitude,@destination.longitude],[@departure.latitude,@departure.longitude]).round
    end
  end

  def edit
    @destination = Destination.find(params[:destination_id])
    @record = Record.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to destination_record_path(@destination.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record).permit(:gasoline_cost, :accommondation_fee, :express_fee, :total, :food_expenses).merge(user_id: current_user.id, destination_id: params[:destination_id])
  end


end
