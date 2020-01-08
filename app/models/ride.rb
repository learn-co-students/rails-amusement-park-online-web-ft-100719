class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction 

  def take_ride 
    rider = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)
    response = ["Sorry."]

    if rider.tickets < attraction.tickets 
      response << "You do not have enough tickets to ride the #{attraction.name}."
    end 

    if rider.height < attraction.min_height 
      response << "You are not tall enough to ride the #{attraction.name}."
    end 

    if response == ["Sorry."]
      tickets = rider.tickets - attraction.tickets
      nausea = rider.nausea + attraction.nausea_rating
      happiness = rider.happiness + attraction.happiness_rating 
      rider.update(tickets: tickets, nausea: nausea, happiness: happiness)
      return "Thanks for riding the #{attraction.name}!"
    else 
      return response.join(" ")
    end 

  end 

end
