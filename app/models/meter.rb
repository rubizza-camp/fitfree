class Meter < ApplicationRecord
  has_and_belongs_to_many :client
end
