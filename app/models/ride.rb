class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        message = "Sorry."
        if !enough_tickets?
            message += " You do not have enough tickets to ride the #{self.attraction.name}."
        end

        if !tall_enough?
            message += " You are not tall enough to ride the #{self.attraction.name}."
        end

        if enough_tickets? && tall_enough?
            message = "Thanks for riding the #{self.attraction.name}!"
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            self.attraction.save
        end
        message
    end

    def enough_tickets?
        self.user.tickets >= self.attraction.tickets
    end

    def tall_enough?
        self.user.height >= self.attraction.min_height
    end

end