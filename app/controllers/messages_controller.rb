class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:user_id], params[:client_id])
  end
end
