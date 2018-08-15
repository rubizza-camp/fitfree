class Exercise < ApplicationRecord
  has_many :exercise_types
  belongs_to :kit
end
