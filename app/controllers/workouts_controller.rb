class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
        @workouts = Workout.all.filter { |workout| workout if workout.users.include?(current_user) }
        render :json => @workouts, include: [:exercises => { :only => [:id, :name] }]
    end
end
