class ExerciseTypesController < ApplicationController
  def index
    exercises = ExerciseType.all
    render :json => exercises, include: [:muscle_table]
  end
end
