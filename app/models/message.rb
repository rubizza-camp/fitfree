class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  enum status: [ :read, :unread ]
end
