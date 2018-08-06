class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.int :user_id
      t.int :client_id
      t.text :text
      t.int :attachment_id

      t.timestamps
    end
  end
end
