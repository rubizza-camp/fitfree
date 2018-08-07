class Amount < ApplicationRecord
  belongs_to :client
  belongs_to :meter
end
