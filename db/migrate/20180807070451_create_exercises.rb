class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :repeat
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
