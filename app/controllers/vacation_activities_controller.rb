class VacationActivitiesController < ApplicationController

  def destroy
    @vacation_activity = VacationActivity.find(params[:id])
    vacation = @vacation_activity.vacation
    @vacation_activity.delete
    redirect_to vacation_path(vacation)
  end

end
