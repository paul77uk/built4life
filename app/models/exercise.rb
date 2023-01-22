class Exercise < ApplicationRecord
  has_many :exercise_sets, dependent: :destroy
  
  belongs_to :day

  validates :title, presence: true

  delegate :workout, to: :day
end
