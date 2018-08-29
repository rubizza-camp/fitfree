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
  belongs_to :exercise_type
  belongs_to :training
end
