class Message < ApplicationRecord
  enum status: [:unread, :read]
  belongs_to :messagable, polymorphic: true
  has_one :attachment

  # after_create_commit {MessageBroadcastJob.perform_now self}
end
