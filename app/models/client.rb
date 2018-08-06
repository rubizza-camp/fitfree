class Client < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :meals
end
