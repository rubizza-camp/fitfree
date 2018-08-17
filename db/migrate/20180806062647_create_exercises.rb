class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :exercise_type_id
      t.integer :kit_id
      t.integer :user_id
      t.integer :repeats
      t.integer :approach

      t.timestamps
    end
  end
end
