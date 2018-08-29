# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#

class User < ApplicationRecord
  has_one :coach_info
  has_one :telegram_bot

  has_many :trainings
  has_many :clients
  has_many :transactions
  after_create :sign_up_for_mailing_list

  has_many :messages, as: :messagable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def sign_up_for_mailing_list
    MailingListSignupJob.perform_later(self)
  end

  def build_telegram_bot

  end

  def block!
    update(blocked_at: Time.zone.now)
  end

  def unblock!
    update(blocked_at: nil)
  end

  def blocked?
    blocked_at.present?
  end

  def active_for_authentication?
    super && !blocked?
  end

  def subscribe
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: email,
        status:        'subscribed'
      }
    )
    Rails.logger.info("Subscribed #{email} to MailChimp") if result
  end
end
