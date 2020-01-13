require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      users_tickets = self.user.tickets - self.attraction.tickets
      users_nausea = self.user.nausea + self.attraction.nausea_rating
      users_happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.update(tickets: users_tickets, nausea: users_nausea, happiness: users_happiness)
    end
  end
end
