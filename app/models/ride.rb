class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !ride_errors
            new_tickets = self.user.tickets - self.attraction.tickets
            new_nausea = self.user.nausea + self.attraction.nausea_rating
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            
            self.user.update(
                :tickets => new_tickets,
                :nausea => new_nausea,
                :happiness => new_happiness
            )
            
            "Thanks for riding the #{attraction.name}!"
        else
            ride_errors
        end
    end

    def ride_errors
        user = self.user
        attraction = self.attraction
        ride_errors = ["Sorry."]

        ride_errors << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
        
        ride_errors << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height

        ride_errors.length > 1 ? ride_errors.join(" ") : nil

    end
end
