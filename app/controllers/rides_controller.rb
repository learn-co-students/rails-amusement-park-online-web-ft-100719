class RidesController < ApplicationController
    before_action :require_login

    def create
        attraction = Attraction.find_by(ride_params)
        if attraction
            @ride = attraction.rides.build(user:current_user)
            if @ride.save
                flash[:message] = @ride.take_ride
                redirect_to current_user
            end
        end
    end

    private
        def ride_params
            params.require(:attraction).permit(:id)
        end
end
