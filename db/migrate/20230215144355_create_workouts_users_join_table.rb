class CreateWorkoutsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :workouts do |t|
      t.index [:user_id, :workout_id]
      t.index [:workout_id, :user_id]
    end
  end
end
