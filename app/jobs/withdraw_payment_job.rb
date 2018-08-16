class WithdrawPaymentJob < ApplicationJob
  queue_as :default

  def perform(indata_json)
    indata = JSON.parse indata_json
    Transaction.new(client_id: indata['client_id'], user_id: indata['user_id'],
                    datetime: indata['time'], price: - indata['price']).save!
  end
end
