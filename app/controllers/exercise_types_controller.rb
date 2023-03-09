class ExerciseTypesController < ApplicationController
  def index
    exercises = ExerciseType.all
    render :json => exercises
  end
end
