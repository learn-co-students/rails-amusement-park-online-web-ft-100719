require 'pry'
class RidesController < ApplicationController
  before_action :logged_in?

  def create
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: current_user.id)
    result = @ride.take_ride
    if result == "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}. You are not tall enough to ride the #{@ride.attraction.name}."
      flash[:notice] = "You do not have enough tickets to ride the #{@ride.attraction.name}"
      flash[:notice] << "You are not tall enough to ride the #{@ride.attraction.name}"
    elsif result == "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}."
      flash[:notice] = "You do not have enough tickets to ride the #{@ride.attraction.name}"
    elsif result == "Sorry. You are not tall enough to ride the #{@ride.attraction.name}."
      flash[:notice] = "You are not tall enough to ride the #{@ride.attraction.name}"
    else
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    end
    redirect_to user_path(@ride.user)
  end
end