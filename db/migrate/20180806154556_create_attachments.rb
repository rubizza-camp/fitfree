class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.integer :message_id
      t.text :name
      t.integer :status
      t.timestamps
    end
  end
end
