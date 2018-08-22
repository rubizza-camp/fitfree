class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    client_id = params[:client_id]
    @payments_list = Transaction.where(client_id: client_id).sort_by(&:datetime).reverse!
    @result_balance = Client.find(client_id).cash
  end

  def create; end

  def add
    current_user.transactions.create(datetime: params[:date],
                                     client_id: params[:client_id],
                                     price: params[:price],
                                     user_id: current_user.id)
    Client.find(params[:client_id]).add_to_cash(params[:price])
  end
end
