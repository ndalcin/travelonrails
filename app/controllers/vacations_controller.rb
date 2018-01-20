class VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :edit, :update, :destroy]

  def index
    @vacations = Vacation.all
    @vacation = Vacation.new
  end

  def new
    if params[:commit] == "I want to go here"
      @vacation = Vacation.new(vacation_params)
    else
      @vacation = current_user.vacations.build
    end
  end

  def create
    @vacation = Vacation.new(vacation_params)
    @vacation.user_id = current_user.id
    if @vacation.save
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @vacation}
      end
    else
      render "edit", notice: "Please fill in all fields"
    end
  end

  def edit

  end

  def update
    @vacation.update(vacation_params)
    if @vacation.save
      redirect_to vacation_path(@vacation)
    else
      render :edit
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @vacation}
    end
  end

  def destroy
    @vacation.delete
    redirect_to user_vacations_path(current_user), notice: "Vacation Successfully Deleted"
  end

  private

  def vacation_params
    params.require(:vacation).permit(:destination_id, :name, :budget, :user_id)
  end

  def set_vacation
    # raise params.inspect
    @vacation = Vacation.find(params[:id])
  end

end
