class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :second_name
      t.string :phone_number
      t.integer :user_id
      t.datetime :birth
      t.string :email
      t.string :instagram_link
      t.string :facebook_link
      t.string :vk_link
      t.integer :status
      t.integer :price

      t.timestamps
    end
  end
end
