class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all

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
