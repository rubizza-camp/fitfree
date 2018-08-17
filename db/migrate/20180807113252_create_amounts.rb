class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.float :quantity
      t.integer :client_id
      t.integer :meter_id

      t.timestamps
    end
  end
end
