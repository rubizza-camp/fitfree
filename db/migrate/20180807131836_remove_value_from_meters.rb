class RemoveValueFromMeters < ActiveRecord::Migration[5.2]
  def change
    remove_column :meters, :value, :float
  end
end
