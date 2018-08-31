class AddBirthdaySeenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday_seen, :boolean, default: false, null: false
  end
end
