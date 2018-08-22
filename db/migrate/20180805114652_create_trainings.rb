class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.datetime :time
      t.integer :price
      t.text :description
      t.integer :user_id
      t.integer :client_id
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
