class AttractionsController < ApplicationController

  def index 
    @user = User.find(current_user)
    @attractions = Attraction.all 
    @new_attraction = Attraction.new 
  end 

  def new 
    @new_attraction = Attraction.new 
    @user = User.find(current_user)
  end 

  def create 
    @attraction = Attraction.new(attraction_params)
    if @attraction.save 
      redirect_to @attraction
    else 
      redirect_to attractions_path
    end 
  end 

  def show 
    @user = User.find(current_user)
    @attraction = Attraction.find_by(id: params[:id])
  end 

  def edit 
    @new_attraction = Attraction.find_by(id: params[:id])
    @user = User.find(current_user)
  end 

  def update 
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)

    redirect_to attraction_path(@attraction)
  end 

  def ride 
    @user = User.find(current_user)
    @attraction = Attraction.find_by(id: params[:attraction_id])
    @ride = Ride.create(attraction_id: @attraction.id, user_id: current_user)
    ride_status = @ride.take_ride 

    redirect_to @user, notice: ride_status 
  end 

  private 

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end 

end
