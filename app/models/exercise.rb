class Exercise < ApplicationRecord
  belongs_to :exercise_type
  belongs_to :training
  # validates :exercise_type_id, presence: true
  # validates :approach, :numericality => { :greater_than => 0 }
  # validates :repeats, :numericality => { :greater_than => 0 }
end
