class AddExerciseTypeToExercise < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :exercise_type, foreign_key: true
  end
end
