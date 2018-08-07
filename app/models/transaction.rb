# == Schema Information
#
# Table name: transactions
#
#  id         :bigint(8)        not null, primary key
#  datetime   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer
#  user_id    :integer
#

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client
end
