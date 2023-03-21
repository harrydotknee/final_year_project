class Exercise < ApplicationRecord
  belongs_to :workout
  has_one :muscle_table
  default_scope { order(:index ) }
end

