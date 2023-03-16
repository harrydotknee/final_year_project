class CreateMuscleTables < ActiveRecord::Migration[7.0]
  def change
    create_table :muscle_tables do |t|
      t.belongs_to :exercise_type, optional: true
      t.belongs_to :exercise, optional: true
      t.integer :chest, default: 0
      t.integer :forearms, default: 0
      t.integer :shoulders, default: 0
      t.integer :triceps, default: 0
      t.integer :biceps, default: 0
      t.integer :abs, default: 0
      t.integer :quads, default: 0
      t.integer :hamstrings, default: 0
      t.integer :calves, default: 0
      t.integer :glutes, default: 0
      t.integer :traps, default: 0
      t.integer :lats, default: 0
      t.integer :middle_back, default: 0
      t.integer :lower_back, default: 0
      t.integer :adductors, default: 0
      t.integer :abductors, default: 0
      t.integer :neck, default: 0

      t.timestamps
    end
  end
end
