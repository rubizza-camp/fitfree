# == Schema Information
#
# Table name: telegram_bots
#
#  id                  :bigint(8)        not null, primary key
#  user_id             :bigint(8)
#  token               :string           default(""), not null
#  telegram_webhook_id :string           default("11d6d037-15d1-4394-9485-5c3bb7b470d3"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class TelegramBot < ApplicationRecord
  belongs_to :user
end
