class Message < ApplicationRecord
  enum status: [:unread, :read]
  belongs_to :messagable, polymorphic: true
  has_one :attachment
end
