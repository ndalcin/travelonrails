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
    if @destination.save
      render :json => @destination
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:city, :country)
  end

end
