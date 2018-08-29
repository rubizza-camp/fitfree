# == Schema Information
#
# Table name: messages
#
#  id              :bigint(8)        not null, primary key
#  text            :string           default(""), not null
#  update_id       :string           default(""), not null
#  status          :integer          default("unread")
#  messagable_type :string
#  messagable_id   :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ApplicationRecord
  enum status: [:unread, :read]
  belongs_to :messagable, polymorphic: true
  has_one :attachment

  # after_create_commit {MessageBroadcastJob.perform_now self}
end
