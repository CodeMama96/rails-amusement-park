class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !not_enough_tickets? && !not_tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif
            !not_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !not_tall_enough?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            new_balance
            new_mood
            "Thanks for riding the #{attraction.name}!"
        end


        # if user.tickets > attraction.tickets && user.height > attraction.min_height
        #     user.tickets -= attraction.tickets
        #     user.nausea += attraction.nausea_rating
        #     user.happiness += attraction.happiness_rating
        #     user.save
        #     "Thanks for riding the #{attraction.name}!"
        # elsif
        
       


        #join both methods together? 
    end

    def not_tall_enough?
        user.height > attraction.min_height 
    end
    def not_enough_tickets? #if they don't have enough tickets
        user.tickets > attraction.tickets 
    end

    def new_balance
        user.update(tickets: user.tickets - attraction.tickets)
    end

    def new_mood
        user.update(nausea: user.nausea + attraction.nausea_rating)
        user.update(happiness: user.happiness + attraction.happiness_rating)
    end

  
end
