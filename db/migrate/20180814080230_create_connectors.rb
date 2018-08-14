class CreateConnectors < ActiveRecord::Migration[5.2]
  def change
    create_table :connectors do |t|
      t.integer :kit_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
