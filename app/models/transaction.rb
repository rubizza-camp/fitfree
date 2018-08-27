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
  validate :date_set
  validates :price, presence: true, numericality: true

  def date_set
    errors.add(:expiration_date, "Date is not set") unless datetime.present?
  end
end

