# == Schema Information
#
# Table name: kinds
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kind < ApplicationRecord
  has_many :metrics
end
