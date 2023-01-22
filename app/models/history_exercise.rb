class HistoryExercise < ApplicationRecord
  belongs_to :history_day
  has_many :history_sets, dependent: :destroy
end
