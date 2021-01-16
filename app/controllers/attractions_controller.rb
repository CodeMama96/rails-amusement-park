class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find_by_id(session[:user_id])
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end


end
