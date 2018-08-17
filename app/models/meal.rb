# == Schema Information
#
# Table name: meals
#
#  id          :bigint(8)        not null, primary key
#  datetime    :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :integer
#

class Meal < ApplicationRecord
  belongs_to :client
end
