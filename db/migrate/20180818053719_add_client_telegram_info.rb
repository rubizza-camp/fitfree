class AddClientTelegramInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :telegram_chat_id, :string
    add_column :clients, :telegram_bind_id, :string, default: SecureRandom.uuid
  end
end
