# == Schema Information
#
# Table name: clients
#
#  id           :bigint(8)        not null, primary key
#  first_name   :string
#  second_name  :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  birth        :datetime
#  email        :string
#

class Client < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :meals
  has_many :transactions
  has_and_belongs_to_many :metrics
  has_many :snapshots
  validates :first_name, :second_name,
            :phone_number, :birth, :status,
            :price, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_many :messages, as: :messagable
  accepts_nested_attributes_for :metrics

  enum status: %i[online offline]

  def result_balance
    result = 0
    Transaction.where(client_id: self.id).each { |transaction| result += transaction.price }
    result
  end
end
