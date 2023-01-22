class HistoryPageController < ApplicationController
  def history_show_page
    # render html: 'hello, world!'
    @history_day = HistoryDay.all
    @history_exercise = HistoryExercise.all
    @history_sets = HistorySet.all
  end
end
