class PaymentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  def index
    @payments_list = Transaction.where(client_id: params[:client_id])
  end

  def create; end

  def add
    # TODO: Add payment to DB
    @transaction = Transaction.new do |transaction|
      transaction.datetime = params[:date]
      transaction.created_at = params[:date]
      transaction.updated_at = transaction.created_at
      transaction.client_id = params[:client_id]
      transaction.price = params[:price]
      transaction.user_id = current_user.id

    end
    require 'pry'; binding.pry
    @transaction.save
  end
end
