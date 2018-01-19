class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :delete]
  before_action :authorize, except: [:list]

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
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to user_activities_path(@activity)
    else
      render :index
    end
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    if @activity.save
      redirect_to user_activities_path(current_user)
    else
      render :edit
    end
  end

  def delete

  end

  private

  def activity_params
    params.require(:activity).permit(:name, :price, :vacation_id, type_ids: [], types_attributes: [:name])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
