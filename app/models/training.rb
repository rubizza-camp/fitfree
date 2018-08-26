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
  belongs_to :user
  belongs_to :client
  has_many :kits

  validates :client_id, :time, presence: true
  validates :price, :numericality => { :greater_than => 0 }
  validates :description, presence: false

  enum status: [:planned, :complete, :canceled]
end
