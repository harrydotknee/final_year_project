class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :index, :muscle_table
  def muscle_table
    object.muscle_table.as_json()
  end
end
