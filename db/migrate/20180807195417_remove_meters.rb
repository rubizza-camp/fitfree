class RemoveMeters < ActiveRecord::Migration[5.2]
  def change
    drop_table :meters
    drop_table :amounts
  end
end
