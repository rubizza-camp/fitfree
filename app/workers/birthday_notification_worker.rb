class BirthdayNotificationWorker
  include Sidekiq::Worker

  def perform
    User.all.each { |user| user.birthday_seen = false; user.save! }
    BirthdayNotificationWorker.perform_at(Date.today + 1.day).to_f
  end
end
