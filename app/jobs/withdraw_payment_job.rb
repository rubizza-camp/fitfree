class WithdrawPaymentJob
  include Sidekiq::Worker
  include Sidekiq::Status::Worker # enables job status tracking

  def perform(indata_json)
    indata = JSON.parse indata_json
    Transaction.new(client_id: indata['client_id'], user_id: indata['user_id'],
                    datetime: indata['time'], price: - indata['price']).save!

    training = Training.find(indata['training_id'])
    training.status = :complete
    training.save!
    Job.where(training_id: training.id).delete_all
  end
end
