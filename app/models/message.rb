class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  enum status: [:unread, :read]
end
