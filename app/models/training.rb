# == Schema Information
#
# Table name: trainings
#
#  id          :bigint(8)        not null, primary key
#  time        :datetime
#  price       :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  client_id   :integer
#  status      :integer
#

class Training < ApplicationRecord
  belongs_to :user
  belongs_to :client

  enum status: [:planned, :complete, :canceled]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :planned
  end
end
