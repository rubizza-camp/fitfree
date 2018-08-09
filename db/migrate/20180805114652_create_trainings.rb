class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.text :title
      t.datetime :time
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
