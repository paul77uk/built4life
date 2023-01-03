class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @workouts = Workout.where(user_id: current_user.id).order(:created_at)
  end

  def show
    @days = @workout.days.order(:created_at)
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id

    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy

    redirect_to workouts_path(@workout)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name)
  end
end
