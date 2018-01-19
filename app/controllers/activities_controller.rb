class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update]

  def list
    @activities = Activity.limit(10)
  end

  def index
    @activities = current_user.activities
    @activity = Activity.new
  end

  def show
    if current_user
      @vacations = current_user.vacations
    end
  end

  def new

  end

  def create
    byebug
    @activity = Activity.new(activity_params)
    byebug
    if @activity.save
      redirect_to vacation_path(vacation)
    end

  end

  # def update
  #   existing_vacation = Vacation.find(params[:activity][:vacation_activities_attributes]["0"][:vacation_id])
  #   @activity.update(activity_params)
  #   if @activity.save
  #     redirect_to vacation_path(existing_vacation)
  #   else
  #     redirect_to type_activity_path(@activity, @activity.type), notice: "Please enter a whole number greater than 0 for number of participants"
  #   end
  # end

  def top_five
    @activities = Activity.top_five
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :price, :rating, :people, :vacation_id, type_ids: [], types_attributes: [:name])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
