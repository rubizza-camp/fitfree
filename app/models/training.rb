class Training < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :kits

  enum status: [:planned, :complete, :incomplete, :canceled]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :planned
  end
end
