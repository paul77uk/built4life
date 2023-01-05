class Day < ApplicationRecord
  has_many :exercises, dependent: :destroy
  belongs_to :workout
  validates :title, presence: true
end
