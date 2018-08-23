class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.belongs_to :users, index: true
      t.datetime :time
      t.integer :price
      t.text :description
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
