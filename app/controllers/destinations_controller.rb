class DestinationsController < ApplicationController
  
  def index
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

end
