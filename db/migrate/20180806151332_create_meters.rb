class CreateMeters < ActiveRecord::Migration[5.2]
  def change
    create_table :meters do |t|
      t.datetime :date
      t.string :type
      t.float :value
      t.integer :client_id

      t.timestamps
    end
  end
end
