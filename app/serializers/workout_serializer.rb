class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercises
  def exercises
    object.exercises.as_json(:only => [:id, :name])
  end
end
