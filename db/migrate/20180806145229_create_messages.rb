class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :client_id
      t.text :text
      t.integer :attachment_id

      t.timestamps
    end
  end
end
