class RidesController < ApplicationController
    def index
    end

    def show
    end

    def create
       @ride =  Ride.find_or_create_by(ride_params) #finding ride assoc to the attractionr
       @ride.take_ride

       flash[:message] = @ride.take_ride 
       redirect_to user_path(@ride.user)

    end


    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end
