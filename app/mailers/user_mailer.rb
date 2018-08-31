class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirm.subject
  #
  def registration_confirm(link, user)
    @greeting = "Hello, #{user.name}"
    @link = link
    mail to: user.email, subject: 'Confirm registration from FitFree'
  end
end
