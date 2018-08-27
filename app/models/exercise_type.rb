# == Schema Information
#
# Table name: exercise_types
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ExerciseType < ApplicationRecord
  paginates_per 10
  validates :name, presence: true, length: { minimum: 3 }
end
