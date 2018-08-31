# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/client_mailer/telegram_link_sender
  def telegram_link_sender
    ClientMailerMailer.telegram_link_sender
  end

end
