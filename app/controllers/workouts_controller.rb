class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
        render json: Workout.all.filter { |workout| workout if workout.users.include?(current_user) }
    end
end
