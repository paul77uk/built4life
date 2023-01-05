class Exercise < ApplicationRecord
  belongs_to :day

  validates :title, presence: true

  delegate :workout, to: :exercise
end
