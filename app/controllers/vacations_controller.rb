class VacationsController < ApplicationController

  def new
    @vacation = Vacation.new
  end

  def create
    if params[:destination_id]
      @vacation = Vacation.new(destination_id: params[:destination_id])
      @vacation.user = current_user
      if @vacation.save
        redirect_to edit_vacation_path(@vacation)
      else
        redirect_to destinations_path
      end
    elsif !!vacation_params
      @vacation = Vacation.new(vacation_params)
      @vacation.user = current_user
      if @vacation.save
        redirect_to vacation_path(@vacation)
      else
        render "edit", notice: "check error messages"
      end
    end
  end

  def edit
    @vacation = Vacation.find(params[:id])
  end

  def update

    @vacation = Vacation.find(params[:id])
    @vacation.update(vacation_params)
    if @vacation.save
      redirect_to vacation_path(@vacation)
    else
      render :edit
    end
  end

  def show
    @vacation = Vacation.find(params[:id])
  end

  private

  def vacation_params
    params.require(:vacation).permit(:date, :destination_id, :name, :budget, :length)
  end

end
