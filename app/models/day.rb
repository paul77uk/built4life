class Day < ApplicationRecord
  belongs_to :workout
  validates :title, presence: true
end
