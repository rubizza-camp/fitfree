class AddClientIdToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :client_id, :integer
  end
end
