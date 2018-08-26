class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :training_id
      t.belongs_to :exercise_type
      t.integer :repeats
      t.integer :approaches
      t.timestamps
    end
  end
end
