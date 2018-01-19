class TypesController < ApplicationController

  def show
    @type = Type.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @type.to_json }
    end
  end

end
