class AddIndexToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :index, :integer, default: -1
  end
end
