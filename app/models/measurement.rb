# == Schema Information
#
# Table name: measurements
#
#  id          :bigint(8)        not null, primary key
#  snapshot_id :bigint(8)
#  metric_id   :bigint(8)
#  value       :decimal(, )
#

class Measurement < ApplicationRecord
  belongs_to :metric
  belongs_to :snapshot
end
