class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :datetime
      t.integer :client_id
      t.integer :user_id
      t.integer :price

      t.timestamps
    end
  end
end
