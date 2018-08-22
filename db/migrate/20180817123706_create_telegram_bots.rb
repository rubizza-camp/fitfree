class CreateTelegramBots < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_bots do |t|
      t.belongs_to :user, index: true
      t.string :token, default: '', null: false
      t.string :telegram_webhook_id, default: SecureRandom.uuid, null: false
      t.timestamps
    end
  end
end
