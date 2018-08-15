class ReplaceClientStatusWithEnum < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :status, :integer
    remove_column :clients, :status_id, :integer
    drop_table :statuses
  end
end
