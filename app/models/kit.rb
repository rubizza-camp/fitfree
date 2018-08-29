# == Schema Information
#
# Table name: kits
#
#  id          :bigint(8)        not null, primary key
#  training_id :integer
#  user_id     :integer
#

class Kit < ApplicationRecord
  has_many :exercises
end
