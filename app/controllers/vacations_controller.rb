class VacationsController < ApplicationController

  def new
    @vacation = Vacation.new
  end

  def create
    @vacation = Vacation.new(vacation_params)
    @vacation.user = current_user
    if !@vacation.date.blank? && @vacation.save
      redirect_to vacation_path(@vacation)
    elsif @vacation.date.blank? && @vacation.save
      render "edit"
    elsif !@vacation.save
      render "edit", notice: "check error messages"
    end
  end

  def show
    @vacation = Vacation.find(params[:id])
  end


  private

  def vacation_params
    params.require(:vacation).permit(:destination_id, :name, :budget, :length, :date)
  end
end
