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
    if !!activity_params
      new_vacation = @activity.vacations.create(activity_params)
      @activity.save
      redirect_to vacation_path(new_vacation)
    end
  end

  def activity_params
    params.require(:activity).permit(:vacations_ids, vacations_attributes: [:name])
  end

end
