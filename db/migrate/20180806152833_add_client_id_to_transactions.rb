class AddClientIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :client_id, :integer
  end
end
