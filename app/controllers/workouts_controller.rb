class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
        @workouts = Workout.all.filter { |workout| workout if workout.users.include?(current_user) }
        render :json => @workouts, include: [:exercises => { :only => [:id, :name] }]
    end

    def create
        workout_params = {
          name: params[:name],
        }
        exercises = params[:exercises]
        @workout = Workout.create(workout_params)
        @workout.users << current_user
        exercises.each do |exercise|
          @workout.add_exercise(Exercise.find_by(name: exercise[:name]))
        end
        render :json => @workout, include: [:exercises => { :only => [:id, :name] }]
    end
end
