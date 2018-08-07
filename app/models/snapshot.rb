class Snapshot < ApplicationRecord
  belongs_to :client
  has_many :metrics, through: :measurements
end