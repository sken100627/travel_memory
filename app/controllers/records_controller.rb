class RecordsController < ApplicationController
  def new
    @destination = Destination.find(params[:destination_id])
    @record = Record.new
  end
end
