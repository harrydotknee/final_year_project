class ExerciseTypesController < ApplicationController
  def index
    @exercises = Exercise.all
    render :json => @exercises
  end
end
