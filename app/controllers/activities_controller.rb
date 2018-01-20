class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:list]

  def list
    @activities = Activity.limit(14)
  end

  def index
    if params[:vacation_id]
      @vacation = Vacation.find(params[:vacation_id])
      @activities = @vacation.activities
      render json: @activities
    elsif params[:user_id]
      @activities = current_user.activities
    end
    @activity = Activity.new
  end

  def show
    # @vacations = current_user.vacations
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @activity}
    end
  end

  def new
    if params[:vacation_id]
      @vacation = Vacation.find(params[:vacation_id])
      @activity = @vacation.activities.build
    else
      @activity = Activity.new
    end

  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      respond_to do |format|
        format.html { redirect_to user_activities_path(@activity) }
        format.json { render json: @activity}
      end
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

  def destroy
    @activity.delete
    redirect_to user_activities_path(current_user)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :price, :vacation_id, type_ids: [], types_attributes: [:name])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
