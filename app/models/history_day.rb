class HistoryDay < ApplicationRecord
  belongs_to :day
  has_many :history_exercises, dependent: :destroy
end
