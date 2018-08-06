class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.int :message_id
      t.varchar :path

      t.timestamps
    end
  end
end
