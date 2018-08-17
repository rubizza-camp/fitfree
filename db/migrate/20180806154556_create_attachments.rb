class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.integer :message_id
      t.text :path

      t.timestamps
    end
  end
end
