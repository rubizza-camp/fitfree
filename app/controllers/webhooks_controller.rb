# The WebhooksController response for handling relegram bot webhook messages
class WebhooksController < ApplicationController

  def callback
    puts
    puts message[:text]
    puts
    if client && message_exist.nil? && message[:text]
      client.messages.create(text: message[:text], update_id: webhook[:update_id])
      send_broadcast
    end
    render nothing: true, head: :ok
  end

  def message_exist
    client.messages.find_by(update_id: webhook[:update_id])
  end

  def send_broadcast
    ActionCable.server.broadcast "messages_#{webhook_id}",
                                 message: message[:text],
                                 user: client.first_name
    head :ok
  end

  def client
    @client ||= Client.find_by(telegram_chat_id: from[:id].to_s) || find_by_binding_id
  end

  def find_by_binding_id
    if msg_entities.present? && msg_entities.first[:type].eql?('bot_command')
      @client = Client.find_by(telegram_bind_id: binding_id) if binding_id
      @client&.update(telegram_chat_id: from[:id])
    end
  end

  def binding_id
    @binding_id ||= message[:text][/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/]
  end

  def webhook_id
    params[:id]
  end

  def webhook
    params['webhook']
  end

  def message
    webhook['message']
  end

  def msg_entities
    message[:entities]
  end

  def from
    message[:from]
  end
end
