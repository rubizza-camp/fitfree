class AddPriceToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :price, :int
  end
end
