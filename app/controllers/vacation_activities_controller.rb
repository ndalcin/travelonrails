class VacationActivitiesController < ApplicationController
  def create
    @vacation = Vacation.find(params[:vacation_id])
    activity = Activity.find(params[:activity_id])
    @vacation.activities << activity
    @vacation.activities_total
    @vacation.save
    redirect_to vacation_path(@vacation)
  end


  private

  def vacation_activities_params
    params.permit(:vacation_id, :activity_id)
  end
end
