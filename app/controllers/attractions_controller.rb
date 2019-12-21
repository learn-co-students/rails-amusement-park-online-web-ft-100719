class AttractionsController < ApplicationController

    before_action :require_login
    before_action :require_admin?, only:[:new,:create,:edit,:update]

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by(id:params[:id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to @attraction
        end
    end

    def edit
        @attraction = Attraction.find_by(id:params[:id])
    end

    def update
        @attraction = Attraction.find_by(id:params[:id])
        if @attraction.update(attraction_params)
            redirect_to @attraction
        end
    end

    private
        def attraction_params
            params.require(:attraction).permit(:name,:min_height,:happiness_rating,:nausea_rating,:tickets)
        end
end
