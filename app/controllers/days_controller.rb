class DaysController < ApplicationController
  before_action :set_workout

  def new
    @day = @workout.days.build
  end

  def create
    @day = @workout.days.build(day_params)

    if @day.save
      redirect_to workout_path(@workout), notice: 'Day was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def day_params
    params.require(:day).permit(:title)
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end
end
