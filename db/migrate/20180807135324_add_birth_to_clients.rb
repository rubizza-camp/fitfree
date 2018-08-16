class AddBirthToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :birth, :datetime
  end
end
