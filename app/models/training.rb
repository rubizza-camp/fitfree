class Training < ApplicationRecord
  belongs_to :user
  belongs_to :client

  enum status: [:planned, :complete, :canceled]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :planned
  end
end
