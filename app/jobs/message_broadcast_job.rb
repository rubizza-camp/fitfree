class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # def perform(message)
  #   # ActionCable.server.broadcast "messages", message: render_message(message)
  #   puts "uiiiiiii #{current_user.telegram_bot.telegram_webhook_id}"
  #   ActionCable.server.broadcast "messages", message: render_message(message), user: "CLient"
  # end
  #
  # private
  # def render_message(message)
  #   {message: message.text, user: Client.find(message.messagable_id)}
  #   # ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  # end
end