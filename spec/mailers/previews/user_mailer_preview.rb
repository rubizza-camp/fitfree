# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/registration_confirm
  def registration_confirm
    UserMailerMailer.registration_confirm
  end

end
