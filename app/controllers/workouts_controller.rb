class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    protect_from_forgery unless: -> { request.format.json? }
    def index
      workouts = Workout.all.filter { |workout| workout if workout.users.include?(current_user) }
      render :json => workouts, include: [:exercises]
    end

    def create
      exercises = params[:exercises]
      workout = Workout.create(name: params[:workout][:name])
      workout.users << current_user
      exercises.each do |exercise|
        workout_exercise = Exercise.create(name: exercise["name"])
        exercise_muscle_table = ExerciseType.find_by(name: exercise["name"]).muscle_table
        exercise.create_muscle_table(exercise_muscle_table)
        workout.exercises << workout_exercise
      end
      render :json => workout, include: [:exercises => { :only => [:id, :name] }]
    end

    def edit
      workout = Workout.find(params[:id])
      exercises = params[:exercises]
      workout.exercises.destroy_all
      exercises.each do |exercise|
        muscle_table = ExerciseType.find_by(name: exercise["name"]).muscle_table
        workout.exercises.create(name: exercise["name"]).create_muscle_table(muscle_table.attributes.except(
          "id",
          "exercise_id",
          "created_at",
          "updated_at"
        ))
      end
      workout.update(name: params[:name])
      render :json => workout, include: [:exercises => { :only => [:id, :name] }]
    end
end
