class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :exercise_type_id
      t.integer :repeats

      t.timestamps
    end
  end
end
