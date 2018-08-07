class Metric < ApplicationRecord
  has_and_belongs_to_many :clients
  has_many :snapshots, through: :measurements
end