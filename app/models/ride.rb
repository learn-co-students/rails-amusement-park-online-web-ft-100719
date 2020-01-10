class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride(rider)
  end 
end
