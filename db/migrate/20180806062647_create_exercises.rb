class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :trainings, index: true
      t.belongs_to :exercise_types, index: true
      t.integer :repeats
      t.integer :approaches
      t.timestamps
    end
  end
end
