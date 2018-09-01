class EatingNotificationJob
  include Sidekiq::Worker
  include Sidekiq::Status::Worker # enables job status tracking

  MESSAGE_TIME_VALUE = {
      '10:30' => 'завтрак',
      '12:30' => 'первый перекус',
      '14:30' => 'обед',
      '16:30' => 'второй перекус',
      '18:30' => 'ужин'
  }.freeze

  def perform(time_s)
    # Execute all doings
    EatingNotificationJob.perform_at(DateTime.now.change(hour: time_s.slice(0..1).to_i, min: time_s.slice(3..4).to_i, day: DateTime.now.day + 1), time_s)
  end
end
