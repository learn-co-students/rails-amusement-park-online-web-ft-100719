class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

  def take_ride
      if enough_tickets_to_ride? < 0 && is_user_tall_enough? < 0
          self.errors[:base] << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
          self.errors.full_messages.join
      elsif enough_tickets_to_ride? < 0 && is_user_tall_enough? >= 0
          self.errors[:base] << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
          self.errors.full_messages.join
      elsif enough_tickets_to_ride? >= 0 && is_user_tall_enough? < 0
          self.errors[:base] << "Sorry. You are not tall enough to ride the #{self.attraction.name}."
          self.errors.full_messages.join
      else
          new_tickets = enough_tickets_to_ride?
          new_nausea = self.user.nausea + self.attraction.nausea_rating
          new_happiness = self.user.happiness + self.attraction.happiness_rating
          self.user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
      end
  end

  def enough_tickets_to_ride?
      self.user.tickets.to_i - self.attraction.tickets.to_i
  end

  def is_user_tall_enough?
      self.user.height - self.attraction.min_height
  end
end