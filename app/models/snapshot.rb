# == Schema Information
#
# Table name: snapshots
#
#  id         :bigint(8)        not null, primary key
#  date       :date             not null
#  client_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Snapshot < ApplicationRecord
  belongs_to :client
  has_many :measurements
  has_many :metrics, through: :measurements

  accepts_nested_attributes_for :measurements

  validates :date, presence: true
end
