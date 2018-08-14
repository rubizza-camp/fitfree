class AddKindIdToMetrics < ActiveRecord::Migration[5.2]
  def change
    add_column :metrics, :kind_id, :integer
  end
end
