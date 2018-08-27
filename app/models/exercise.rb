# == Schema Information
#
# Table name: exercises
#
#  id               :bigint(8)        not null, primary key
#  exercise_type_id :integer
#  kit_id           :integer
#  user_id          :integer
#  repeats          :integer
#  approach         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Exercise < ApplicationRecord
  has_one :exercise_types

  validates :exercise_type_id, presence: true
  validates :approach, :numericality => { :greater_than => 0 }
  validates :repeats, :numericality => { :greater_than => 0 }
end
