class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name, default: '', null: false
      t.string :second_name, default: '', null: false
      t.string :phone_number, default: '', null: false
      t.integer :user_id
      t.datetime :birth, default: Time.now, null: false
      t.string :email, default: '', null: false
      t.string :instagram_link, default: '', null: false
      t.string :facebook_link, default: '', null: false
      t.string :vk_link, default: '', null: false
      t.integer :status, default: 0, null: false
      t.integer :price, default: 0, null: false
      t.integer :gender
      t.timestamps
    end
  end
end
