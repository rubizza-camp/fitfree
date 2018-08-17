class RemoveTypeFromMeters < ActiveRecord::Migration[5.2]
  def change
    remove_column :meters, :type, :string
  end
end
