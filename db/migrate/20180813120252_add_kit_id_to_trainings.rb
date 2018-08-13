class AddKitIdToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :kit_id, :integer
  end
end
