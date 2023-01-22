class Day < ApplicationRecord
  has_many :exercises, dependent: :destroy
  has_many :history_days
  belongs_to :workout
  validates :title, presence: true
end
