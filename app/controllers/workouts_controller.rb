class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
      workouts = Workout.all.filter { |workout| workout if workout.users.include?(current_user) }
      render :json => workouts, include: [:exercises => { :only => [:id, :name] }]
    end

    def create
      exercises = params[:exercises]
      workout = Workout.create(name: params[:workout][:name])
      workout.users << current_user
      exercises.each do |exercise|
        workout.exercises.create(name: exercise["name"])
      end
      render :json => workout, include: [:exercises => { :only => [:id, :name] }]
    end

    def edit
      workout = Workout.find(params[:id])
      exercises = params[:exercises]
      exercises.each { |exercise| workout.exercises.create(name: exercise["name"])}
      workout.update(name: params[:name])
      render :json => workout, include: [:exercises => { :only => [:id, :name] }]
    end
end
