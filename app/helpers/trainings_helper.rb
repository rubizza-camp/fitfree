module TrainingsHelper
  class BackgroundProccess
    TRAINING_DURATION = 2.hours
    def self.create_background_proc(training_id)
      training = Training.find(training_id)
      result_time = training.time + TRAINING_DURATION
      tmp = WithdrawPaymentJob.perform_at(result_time.to_f,
                                          {client_id:   training.client_id,
                                           user_id:     training.user_id,
                                           time:        result_time,
                                           price:       training.price,
                                           training_id: training.id}.to_json)
      job = Job.new(GUID: tmp, training_id: training.id)
      job.save!
    end

    def self.delete_background_proc(training_id)
      job = Job.where(training_id: training_id).first
      Sidekiq::Status.cancel job.GUID
      job.delete
    end
  end
end
