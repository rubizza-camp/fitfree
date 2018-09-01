class BirthdayNotificationWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(*args)
    User.all.each { |user| user.birthday_seen = false; user.save! }
    BirthdayNotificationWorker.perform_at(DateTime.now.tomorrow)
  end
end
