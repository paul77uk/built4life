class HistoryPagesController < ApplicationController
  def index
    # render html: 'hello, world!'
    @history_days = HistoryDay.all
    @history_exercises = HistoryExercise.all
    @history_sets = HistorySet.all
  end
end

def destroy
  @history_day = HistoryDay.find(params[:id])
  @history_day.destroy

  respond_to do |format|
    format.html { redirect_to history_pages_path, notice: 'History day was successfully destroyed.' }
    format.turbo_stream { flash.now[:notice] = 'History day was successfully destroyed.' }
  end
end
