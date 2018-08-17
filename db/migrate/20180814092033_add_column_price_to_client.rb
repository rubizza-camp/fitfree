class AddColumnPriceToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :price, :integer
    add_column :clients, :integer, :string
  end
end
