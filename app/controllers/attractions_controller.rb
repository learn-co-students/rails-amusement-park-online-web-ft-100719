class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        @ride = @attraction.rides.build(user_id: current_user)
    end
end