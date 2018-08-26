# == Schema Information
#
# Table name: metrics
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  units      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind_id    :integer
#

class Metric < ApplicationRecord
  has_and_belongs_to_many :clients
  has_many :measurements
  has_many :snapshots, through: :measurements
  belongs_to :kind
  validates :name, :units, presence: true
  paginates_per 10
end
