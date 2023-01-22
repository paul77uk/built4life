class HistoryDaysController < ApplicationController
  before_action :set_workout
  before_action :set_day
  # before_action :set_history_day
  # before_action :set_history_exercise
  # before_action :set_exercise
  # before_action :set_exercise_set

  def index
    @history_days = HistoryDay.all
    @history_exercises = HistoryExercise.all
    @history_sets = HistorySet.all
  end

  def create
    @history_day = HistoryDay.create(day_id: @day.id, date: Time.now)
    exercises = Exercise.where(day_id: @day.id)
    exercises.each do |exercise|
      HistoryExercise.create(history_day_id: @history_day.id, title: exercise.title)
      # exercise.exercise_sets.each do |exercise_set|
      #   HistorySet.create(history_exercise_id: @)
      # end
    end

    hes = HistoryExercise.where(history_day: @history_day.id)
    # hes.each do |he|
    #   HistorySet.create(history_exercise_id: he.id)
    # end

    hes.zip exercises.each do |he, exercise|
      exercise.exercise_sets.each do |es|
        HistorySet.create(history_exercise_id: he.id, exercise_set: es.set_number, weight: es.weight,
                          reps_dist: es.reps_dist)
      end
    end

    # @es.each do |exercise_set|

    #     HistorySet.create(history_exercise_id: exercise_set.exercise_id, exercise_set: exercise_set.set_number, weight: exercise_set.weight, reps_dist: exercise_set.reps_dist)

    # end

    # @history_exercises.each do |history_exercise|
    #   @history_set = history_exercise.history_sets.create(history_exercise_id: history_exercise.id, exercise_set: exercise_set.set_number, weight: exercise_set.weight, reps_dist: exercise_set.reps_dist)
    # end

    # @exercise_sets.each do |exercise_set|
    #   @history_set = history_exercise.history_sets.create(history_exercise_id: history_exercise.id, exercise_set: exercise_set.set_number, weight: exercise_set.weight, reps_dist: exercise_set.reps_dist)
    # end

    if @history_day.save
      redirect_to history_page_path, notice: 'History was successfully created.'
    else
      render :new, status: :unprocessable_entity
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

  # def set_history_day
  #   @history_day = @day.history_days.find(params[:day_id])
  # end

  # def set_history_exercise
  #   @history_exercise = @history_day.history_exercises.find(params[:history_id])
  # end
  # def set_exercise_set
  #   @exercise_set = @exercise.exercise_sets.find(params[:exercise_set_id])
  # end
end
