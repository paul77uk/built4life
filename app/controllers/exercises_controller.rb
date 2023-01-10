class ExercisesController < ApplicationController
  before_action :set_workout
  before_action :set_day
  before_action :set_exercise, only: %i[edit update destroy]

  def new
    @exercise = @day.exercises.build
  end

  def create
    @exercise = @day.exercises.build(exercise_params)

    if @exercise.save
      respond_to do |format|
        format.html { redirect_to workout_day_path(@workout, @day), notice: 'Day was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Day was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @exercise.update(exercise_params)
      respond_to do |format|
        format.html do
          redirect_to workout_day_path(@workout, @day), notice: 'Exercise was successfully updated.'
        end
        format.turbo_stream { flash.now[:notice] = 'Exercise was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to workout_day_path(@workout, @day), notice: 'Day was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Day was successfully destroyed.' }
    end
  end

  private

  def set_exercise
    @exercise = @day.exercises.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:title)
  end

  def set_day
    @day = @workout.days.find(params[:day_id])
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end
end
