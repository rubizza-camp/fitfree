class AddBlockedAtToAdministrators < ActiveRecord::Migration[5.2]
  def change
    add_column :administrators, :blocked_at, :datetime
  end
end
