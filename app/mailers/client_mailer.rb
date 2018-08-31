class ClientMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.telegram_link_sender.subject
  #
  def telegram_link_sender(client)
    @greeting = "Hello, #{client.full_name}"
    @telegram_link = "http://t.me/fitfree_bot?start=#{client.telegram_bind_id}"
    mail to: client.email, subject: 'Telegram bot link'
  end
end
