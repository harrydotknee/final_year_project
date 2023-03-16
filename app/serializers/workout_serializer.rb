class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercises
  def exercises
    object.exercises.as_json(:include => [:muscle_table])
  end
end
