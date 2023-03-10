class ExerciseSetsController < ApplicationController
  before_action :set_workout
  before_action :set_day
  before_action :set_exercise
  before_action :set_exercise_set, only: %i[edit update destroy]

  def new
    @exercise_set = @exercise.exercise_sets.build
  end

  def create
    @exercise_set = @exercise.exercise_sets.build(exercise_set_params)

    if @exercise_set.save
      respond_to do |format|
        format.html { redirect_to workout_day_path(@workout, @day), notice: 'Set was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Set was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @exercise_set.update(exercise_set_params)
      respond_to do |format|
        format.html { redirect_to workout_day_path(@workout, @day), notice: 'Set was successfully updated.' }

        format.turbo_stream { flash.now[:notice] = 'Set was successfully updated.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise_set.destroy

    respond_to do |format|
      format.html { redirect_to workout_day_path(@workout, @day), notice: 'Set was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Set was successfully destroyed.' }
    end
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:exercise_id, :set_number, :weight, :reps_dist, :completed)
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end

  def set_day
    @day = @workout.days.find(params[:day_id])
  end

  def set_exercise
    @exercise = @day.exercises.find(params[:exercise_id])
  end

  def set_exercise_set
    @exercise_set = @exercise.exercise_sets.find(params[:id])
  end
end
