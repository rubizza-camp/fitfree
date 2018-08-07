class AddUnitsToMeters < ActiveRecord::Migration[5.2]
  def change
    add_column :meters, :unit, :string
  end
end
