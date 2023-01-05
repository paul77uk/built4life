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
      respond_to do |format|
        format.html { redirect_to workouts_path, notice: 'Quote was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      respond_to do |format|
        format.html { redirect_to workouts_path, notice: 'Workout was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Workout was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_path, notice: 'Workout was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name)
  end
end
