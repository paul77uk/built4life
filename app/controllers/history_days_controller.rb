class HistoryDaysController < ApplicationController
  before_action :set_workout, only: %i[create]
  before_action :set_day, only: %i[create]
  # before_action :set_history_day, only: %i[destroy]
  # before_action :set_history_exercise
  # before_action :set_exercise
  # before_action :set_exercise_set

  def index
    workouts = current_user.workouts
    workout = workouts.first
    days = workout.days
    @history_days = HistoryDay.where(day_id: days.first.id)
    @history_exercises = HistoryExercise.all
    @history_sets = HistorySet.all
  end

  def create
    history_day = HistoryDay.create(day_id: @day.id, date: Time.now)
    exercises = Exercise.where(day_id: @day.id)
    exercises.each do |exercise|
      HistoryExercise.create(history_day_id: history_day.id, title: exercise.title)
    end

    hes = HistoryExercise.where(history_day: history_day.id)

    hes.zip exercises.each do |he, exercise|
      exercise.exercise_sets.each do |es|
        HistorySet.create(history_exercise_id: he.id, exercise_set: es.set_number, weight: es.weight,
                          reps_dist: es.reps_dist)
      end
    end

    if history_day.save
      redirect_to history_days_path, notice: 'History was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @history_day = HistoryDay.find(params[:id])
    @history_day.destroy

    respond_to do |format|
      format.html { redirect_to history_days_path, notice: 'History day was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'History day was successfully destroyed.' }
    end
  end

  # def show; end

  private

  def history_params
    params.require(:history_day).permit(:date)
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end

  def set_day
    @day = @workout.days.find(params[:day_id])
  end

  # def set_exercise
  #   @exercise = @day.exercises.find(params[:exercise_id])
  # end

  def set_history_day
    @history_day = @day.history_days.find(params[:day_id])
  end

  # def set_history_exercise
  #   @history_exercise = @history_day.history_exercises.find(params[:history_id])
  # end
  # def set_exercise_set
  #   @exercise_set = @exercise.exercise_sets.find(params[:exercise_set_id])
  # end
end
