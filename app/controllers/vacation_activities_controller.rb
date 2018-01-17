class VacationActivitiesController < ApplicationController


  def index
    binding.pry
    vacation = Vacation.find(params[:vacation_id])
    @vacation_activities = vacation.vacation_activities
    render json: @vacation_activities
  end


  def destroy
    @vacation_activity = VacationActivity.find(params[:id])
    vacation = @vacation_activity.vacation
    @vacation_activity.delete
    redirect_to vacation_path(vacation)
  end


  def vacation_activity_params
    params.permit(:vacation_id)
  end
end
