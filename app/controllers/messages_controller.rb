class MessagesController < ApplicationController
  before_action :message_params

  def show
    @message = Message.find(params[:user_id], params[:client_id])
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :client_id)
  end
end
