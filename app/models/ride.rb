class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  

  def take_ride
    too_short = "You are not tall enough to ride the #{self.attraction.name}."
    too_few_tickets = "You do not have enough tickets to ride the #{self.attraction.name}."
    msg = "Sorry."
    can_ride = true
  
    if not_enough_tickets 
      msg = msg + " " +  too_few_tickets
      can_ride = false
    end
    
    if not_tall_enough 
      msg = msg + " " +  too_short
      can_ride = false
    end

    if can_ride 
      go_on_ride 
      msg = "Thank you for riding the #{self.attraction.name}."
    end
    return msg
  end

  def go_on_ride
    self.user.tickets -= self.attraction.tickets
    self.user.nausea +=  self.attraction.nausea_rating
    self.user.happiness +=  self.attraction.happiness_rating
    self.user.save
  end

  def not_enough_tickets
    if self.user.tickets < self.attraction.tickets
      return true
    else
      return false
    end
  end

  def not_tall_enough
    if self.user.height < self.attraction.min_height
      return true
    else
      return false
    end
  end
  
end
