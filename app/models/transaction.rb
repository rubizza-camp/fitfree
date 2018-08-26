# == Schema Information
#
# Table name: transactions
#
#  id         :bigint(8)        not null, primary key
#  datetime   :datetime
#  client_id  :integer
#  user_id    :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client
end
