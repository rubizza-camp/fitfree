class AddStatusToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :status, :integer
  end
end
