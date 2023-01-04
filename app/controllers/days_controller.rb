class DaysController < ApplicationController
  before_action :set_workout
  before_action :set_day, only: %i[edit update destroy]

  def new
    @day = @workout.days.build
  end

  def create
    @day = @workout.days.build(day_params)

    if @day.save
      respond_to do |format|
        format.html { redirect_to workout_path(@workout), notice: 'Day was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Day was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @day.update(day_params)
      respond_to do |format|
        format.html { redirect_to workout_path(@workout), notice: 'Day was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Day was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @day.destroy

    respond_to do |format|
      format.html { redirect_to workout_path(@workout), notice: 'Day was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Day was successfully destroyed.' }
    end
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
