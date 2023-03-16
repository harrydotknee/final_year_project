class MuscleTable < ApplicationRecord
  belongs_to :exercise_type, optional: true
  belongs_to :exercise, optional: true
end
