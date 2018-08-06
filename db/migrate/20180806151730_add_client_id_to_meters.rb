class AddClientIdToMeters < ActiveRecord::Migration[5.2]
  def change
    add_column :meters, :client_id, :integer
  end
end
