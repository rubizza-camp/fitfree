class Client < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :meals
  has_and_belongs_to_many :meters
  has_many :transactions
end
