class TelegramApiRestService
  TELEGRAM_API = 'https://api.telegram.org/'

  def self.api_req(token)
    "#{TELEGRAM_API}bot#{token}"
  end

  def self.reg_bot_webhook_for_domen(bot, domen)
    Excon.get("#{api_req(bot.token)}/setWebhook?url=https://#{domen}/#{bot.telegram_webhook_id}")
  end

  def self.delete_webhook_for_bot(bot)
    Excon.get("#{api_req(bot.token)}/deleteWebhook")
  end

  def self.send_message_from_bot_to_chat(bot, chat_id, msg)
    Excon.get(URI.encode("#{api_req(bot.token)}/sendMessage?chat_id=#{chat_id}&text=#{msg}"))
  end

  # todo: need test
  def self.load_file_from_bot(bot, file_id)
    response = Excon.get("#{api_req(bot.token)}/getFile?file_id=#{file_id}")
    if response.status == 200 && JSON.parse(response.body)["result"]["file_path"]
      file_path = JSON.parse(response.body)["result"]["file_path"]
      Excon.get("#{TELEGRAM_API}file/bot#{bot.token}/#{file_path}")
    end
  end

end
