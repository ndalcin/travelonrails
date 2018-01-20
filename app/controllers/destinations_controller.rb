class DestinationsController < ApplicationController

  def index
    @destination = Destination.new
    @destinations = Destination.all
    @vacation = Vacation.create
    if !params[:location].blank?
      if params[:location] == "Domestic"
        @destinations = Destination.domestic
      else
        @destinations = Destination.international
      end
    else
      @destinations = Destination.all
    end
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.save
  end

end
