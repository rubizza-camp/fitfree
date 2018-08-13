class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :datetime
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
