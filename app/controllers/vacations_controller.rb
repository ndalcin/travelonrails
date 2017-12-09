class VacationsController < ApplicationController

  def index
    @vacations = Vacation.all
  end

  def new
    @vacation = Vacation.new
  end

  def create
    if params[:destination_id]
      @vacation = Vacation.new(destination_id: params[:destination_id])
      @vacation.user = current_user
      if @vacation.save
        redirect_to edit_user_vacation_path(current_user, @vacation)
      else
        redirect_to destinations_path
      end
    elsif !!vacation_params
      @vacation = Vacation.new(vacation_params)
      @vacation.user = current_user
      if @vacation.save
        redirect_to vacation_path(@vacation)
      else
        render "edit"
      end
    end
  end

  def edit
    @vacation = Vacation.find(params[:id])
  end

  def update

    @vacation = Vacation.find(params[:id])
    @vacation.update(vacation_params)
    if @vacation.save
      redirect_to vacation_path(@vacation)
    else
      render :edit
    end
  end

  def show
    @vacation = Vacation.find(params[:id])
  end

  def destroy
    @vacation = Vacation.find(params[:id])
    @vacation.delete
    redirect_to user_vacations_path(current_user), notice: "Vacation Successfully Deleted"
  end

  private

  def vacation_params
    params.require(:vacation).permit(:date, :destination_id, :name, :budget, :length)
  end

end
