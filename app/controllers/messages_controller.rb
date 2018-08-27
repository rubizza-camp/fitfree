class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @client = client
  end

  def create
    response = send_message
    if response.status == 200 && JSON.parse(response.body)['result']
      current_user.messages.create(text: message)
      render plain: message
    else
      render plain: 'image doesnt send'
    end
  end

  def message
    params[:message]
  end

  def client
    @client ||= Client.find_by(id: params[:client_id])
  end

  def chat_id
    client.telegram_chat_id if client
  end

  def token
    current_user.telegram_bot.token
  end

  def send_message
    Excon.get("https://api.telegram.org/bot#{token}/sendMessage?chat_id=#{chat_id}&text=#{message}")
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :client_id)
  end
end
