class CreateKits < ActiveRecord::Migration[5.2]
  def change
    create_table :kits do |t|
      t.string :title
      t.text :description
      t.integer :client_id
      t.integer :exercise_id
      t.integer :repeats

      t.timestamps
    end
  end
end
