class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :exercise_type
      t.integer :kit_id
      t.integer :repeats
      t.integer :approaches
      t.timestamps
    end
  end
end
