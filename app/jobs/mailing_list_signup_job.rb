class MailingListSignupJob < ApplicationJob
  def perform(user)
    #require "pry"; binding.pry
    # logger.info "signing up #{user.email}"
    # user.subscribe
    # user.subscribe
    UserNotifierMailer.with(user: user).send_signup_email.deliver_now
  end
end
