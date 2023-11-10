class DeparturesController < ApplicationController
  def new
    @departure = Departure.new
  end
end
