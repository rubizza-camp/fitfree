class PaymentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @payments_list = Transaction.where(client_id: client_id).order(created_at: :desc)
    @payments_list = @payments_list.page(params[:page])
    @result_balance = Client.find(client_id).cash
  end

  def create; end

  def delete
    transaction = Transaction.find(params[:id])
    add_cash(-transaction.price)
    transaction.delete
    redirect_to "/clients/#{client_id}/payments"
  end

  def add
    transaction = current_user.transactions.create(datetime: params[:date],
                                                   client_id: client_id,
                                                   price: params[:price],
                                                   user_id: current_user.id)
    add_cash(transaction.price) if transaction.valid?
    redirect_to "/clients/#{client_id}/payments"
  end

  private
  def client_id
    params[:client_id]
  end

  def client
    @client ||= Client.find(client_id)
  end

  def add_cash(price)
    client.add_to_cash(price)
    client.save!
  end
end
