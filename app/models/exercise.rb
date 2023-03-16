class Exercise < ApplicationRecord
  belongs_to :workout
  has_one :muscle_table
end

