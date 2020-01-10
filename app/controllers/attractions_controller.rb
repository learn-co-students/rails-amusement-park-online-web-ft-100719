class AttractionsController < ApplicationController
  
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@post)
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:attraction).permit(:name, 
                                :nausea_rating, 
                                :happiness_rating,
                                :tickets,
                                :min_height)
  end
  
  
end

