class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
      workouts = Workout.all.filter { |workout| workout if workout.users.include?(current_user) }
      render :json => workouts, include: [:exercises => { :only => [:id, :name] }]
    end

    def create
      exercises = params[:workout][:exercises]
      workout = Workout.create(name: params[:workout][:name])
      workout.users << current_user
      exercises.each do |exercise|
        workout.add_exercise(Exercise.find_by(name: exercise))
      end
      render :json => @workout, include: [:exercises => { :only => [:id, :name] }]
    end

    def edit
      workout = Workout.find(params[:id])
      exercises = params[:exercises]
      debugger
      new_exercises = exercises.map { |exercise| Exercise.find_by(name: exercise["name"]) }
      workout.update(name: params[:name], exercises: new_exercises)
      render :json => workout, include: [:exercises => { :only => [:id, :name] }]
    end
end
