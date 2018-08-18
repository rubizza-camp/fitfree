class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    puts message[:text]
    if client && !client.messages.find_by(update_id: webhook[:update_id])
      client.messages.create(text: message[:text], update_id: webhook[:update_id])
    end
    puts 'a' unless client.nil?
    render nothing: true, head: :ok
  end

  def webhook
    params['webhook']
  end

  def message
    webhook['message']
  end

  def from
    webhook[:message][:from]
  end

  def client
    @client ||= Client.find_by(telegram_chat_id: from[:id].to_s) || find_by_binding_id
  end

  def find_by_binding_id
    if message[:entities].present? && message[:entities].first[:type].eql?('bot_command')
      text = message[:text][/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/]
      @client = Client.find_by(telegram_bind_id: text) if text
      @client.update(telegram_chat_id: from[:id]) if @client
    end
  end

  # def register_client
  #   @user = User.find_or_initialize_by(telegram_chat_id: from[:id])
  #   @user.update_attributes!(first_name: from[:first_name], last_name: from[:last_name])
  #   @user
  # end
end
