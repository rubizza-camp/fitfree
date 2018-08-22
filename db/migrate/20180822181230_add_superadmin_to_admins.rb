class AddSuperadminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :superadmin, :bool
  end
end
