class AddUserIdToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :user_id, :integer
  end
end
