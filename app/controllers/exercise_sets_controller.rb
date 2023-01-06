class ExerciseSetsController < ApplicationController
  before_action :set_workout
  before_action :set_day
  before_action :set_exercise

  def new
    @exercise_set = @exercise.exercise_sets.build
  end

  def create
    @exercise_set = @exercise.exercise_sets.build(exercise_set_params)

    if @exercise_set.save
      redirect_to workout_day_path(@workout, @day), notice: 'Set was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:set_number, :weight, :reps_dist, :completed)
  end

  def set_day
    @day = @workout.days.find(params[:day_id])
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end

  def set_exercise
    @exercise = @day.exercises.find(params[:exercise_id])
  end
end
