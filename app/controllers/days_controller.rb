class DaysController < ApplicationController
  before_action :set_workout
  before_action :set_day, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @day.update(day_params)
      redirect_to workout_path(@workout), notice: 'Day was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @day.destroy

    redirect_to workout_path(@workout)
  end

  private

  def set_day
    @day = @workout.days.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:title)
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end
end
