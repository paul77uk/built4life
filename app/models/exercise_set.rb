class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  delegate :day, to: :exercise
end
