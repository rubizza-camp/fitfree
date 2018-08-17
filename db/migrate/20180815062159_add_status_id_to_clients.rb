class AddStatusIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :status, :integer
  end
end
