# == Schema Information
#
# Table name: trainings
#
#  id          :bigint(8)        not null, primary key
#  time        :datetime
#  price       :integer
#  description :text
#  user_id     :integer
#  client_id   :integer
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Training < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :clients
  has_many :exercises

  enum status: %i[is_created planned complete canceled]
end
