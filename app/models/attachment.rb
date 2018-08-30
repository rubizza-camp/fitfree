# == Schema Information
#
# Table name: attachments
#
#  id         :bigint(8)        not null, primary key
#  message_id :integer
#  path       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attachment < ApplicationRecord
  enum status: %i[breakfast lunch dinner afternoon_snack supper]
  belongs_to :message
end
