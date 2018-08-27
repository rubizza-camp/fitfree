# == Schema Information
#
# Table name: jobs
#
#  id          :bigint(8)        not null, primary key
#  GUID        :string
#  training_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ApplicationRecord
  belongs_to :training
end
