class PaymentsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @payments_list = Transaction.where(client_id: params[:client_id]).sort_by(&:datetime).reverse!
    @result_balance = Client.find(params[:client_id]).result_balance
  end

  def create; end

  def add
    @transaction = Transaction.new do |transaction|
      transaction.datetime = params[:date]
      transaction.created_at = params[:date]
      transaction.updated_at = transaction.created_at
      transaction.client_id = params[:client_id]
      transaction.price = params[:price]
      transaction.user_id = current_user.id
    end
    @transaction.save
  end
end
