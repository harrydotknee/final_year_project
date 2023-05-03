class AddRepsSetsWeightsToExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :reps, :integer, default: 0
    add_column :exercises, :sets, :integer, default: 0
    add_column :exercises, :weight, :integer, default: 0
  end
end
