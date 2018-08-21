class Exercise < ApplicationRecord
  has_one :exercise_types

  validates :exercise_type_id, presence: true
  validates :approach, :numericality => { :greater_than => 0 }
  validates :repeats, :numericality => { :greater_than => 0 }
end
