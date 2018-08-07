class Measurement < ApplicationRecord
  belongs_to :metric
  belongs_to :snapshot
end