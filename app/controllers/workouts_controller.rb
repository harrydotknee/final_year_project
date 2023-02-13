class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
        render json: Workout.all
        puts Workout.all
    end
end
