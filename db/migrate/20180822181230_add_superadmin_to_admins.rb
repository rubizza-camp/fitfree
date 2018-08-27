class AddSuperadminToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :administrators, :superadmin, :bool
  end
end
