class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts
  end

  def show
    @days = @workout.days
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)

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
