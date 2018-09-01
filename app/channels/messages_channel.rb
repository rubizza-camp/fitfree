class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "messages_#{current_user.telegram_bot.telegram_webhook_id}"
    stream_from "messages_#{current_user.bot_token}"
  end
end