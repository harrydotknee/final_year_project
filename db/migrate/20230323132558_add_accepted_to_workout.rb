class AddAcceptedToWorkout < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :accepted, :boolean, default: true
  end
end
