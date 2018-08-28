class Attachment < ApplicationRecord
  enum status: %i[breakfast lunch dinner afternoon_snack supper]
  belongs_to :message
end
