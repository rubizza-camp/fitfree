class CreateExerciseSets < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_sets do |t|
      t.references :exercises, foreign_key: true
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
