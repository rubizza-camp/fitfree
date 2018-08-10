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

  accepts_nested_attributes_for :metrics
end
