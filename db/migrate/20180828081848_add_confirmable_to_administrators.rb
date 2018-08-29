class AddConfirmableToAdministrators < ActiveRecord::Migration[5.2]
  def up
    add_column :administrators, :confirmation_token, :string
    add_column :administrators, :confirmed_at, :datetime
    add_column :administrators, :confirmation_sent_at, :datetime
    # add_column :administrators, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :administrators, :confirmation_token, unique: true
    # Administrator.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # administrators as confirmed, do the following
    Administrator.all.update_all confirmed_at: DateTime.now
    # All existing Administrator accounts should be able to log in after this.
  end

  def down
    remove_columns :administrators, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :administrators, :unconfirmed_email # Only if using reconfirmable
  end
end
