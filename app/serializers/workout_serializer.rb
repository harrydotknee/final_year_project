class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :accepted, :exercises
  def exercises
    object.exercises.as_json(:include => [:muscle_table])
  end
end
