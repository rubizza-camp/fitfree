class AddCashToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :cash, :integer, default: 0, null: false
  end
end
