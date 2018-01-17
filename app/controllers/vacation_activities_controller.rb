class VacationActivitiesController < ApplicationController


  def index
    byebug
    vacation = Vacation.find(params[:id])
    @vacation_activities = vacation.activities
  end


  def destroy
    @vacation_activity = VacationActivity.find(params[:id])
    vacation = @vacation_activity.vacation
    @vacation_activity.delete
    redirect_to vacation_path(vacation)
  end

end
