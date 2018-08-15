class Kit < ApplicationRecord
  belongs_to :training
  has_many :exercises
end
