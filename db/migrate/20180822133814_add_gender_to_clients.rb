class AddGenderToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :gender, :integer
  end
end
