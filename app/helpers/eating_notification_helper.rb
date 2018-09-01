class EatingNotificationHelper
  def self.set_task(time_string)
    date_now = DateTime.now
    target_datetime = DateTime.now.change(hour: time_string.slice(0..1).to_i, min: time_string.slice(3..4).to_i)

    target_datetime = target_datetime.change(day: target_datetime.day + 1) if date_now >= target_datetime
    EatingNotificationJob.perform_at(target_datetime, time_string)
  end
end