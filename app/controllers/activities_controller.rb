class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    if current_user
      @vacations = current_user.vacations
    end
  end

  def update
    @activity = Activity.find(params[:id])
    existing_vacation = Vacation.find(params[:activity][:vacation_activities_attributes]["0"][:vacation_id])
    @activity.update(activity_params)
    @activity.save
    redirect_to vacation_path(existing_vacation)
  end

  def top_five
    @activities = Activity.top_five
  end

  def activity_params
    params.require(:activity).permit(vacation_activities_attributes: [:vacation_id, :people])
  end

end
