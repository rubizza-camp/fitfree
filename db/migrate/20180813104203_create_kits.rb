class CreateKits < ActiveRecord::Migration[5.2]
  def change
    create_table :kits do |t|
      t.integer :training_id
      t.integer :user_id

      t.timestamps
    end
  end
end
