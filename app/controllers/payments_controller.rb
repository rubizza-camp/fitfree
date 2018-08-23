class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    client_id = params[:client_id]
    @payments_list = Transaction.where(client_id: client_id).order(created_at: :desc)
    @payments_list = @payments_list.paginate(page: params[:page], per_page: 10)
    @result_balance = Client.find(client_id).cash
  end

  def create; end

  def delete
    trans = Transaction.find(params[:id])
    client = Client.find(params[:client_id])
    client.add_to_cash(-trans.price)
    client.save!
    trans.delete
    redirect_to "/clients/#{params[:client_id]}/payments"
  end

  def add
    current_user.transactions.create(datetime: params[:date],
                                     client_id: params[:client_id],
                                     price: params[:price],
                                     user_id: current_user.id)
    Client.find(params[:client_id]).add_to_cash(params[:price])
    redirect_to "/clients/#{params[:client_id]}/payments"
  end
end
