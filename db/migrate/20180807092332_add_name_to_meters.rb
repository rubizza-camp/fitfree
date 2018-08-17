class AddNameToMeters < ActiveRecord::Migration[5.2]
  def change
    add_column :meters, :name, :string
  end
end
