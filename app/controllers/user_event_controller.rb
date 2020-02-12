class UserEventController < ApplicationController

    def index
        user_events = UserEvent.where(params[:user_id])

        render json: user_events
    end 

    def show
        user_event = UserEvent.find(params[:id])
        
    end 

    def create
        user_event = UserEvent.create(user_event_params)
        community_event = user_event.community_event
        community_event.update(status: "Accepted")
        options = {}

        if user_event.valid?

            render json: user_event, :include => [:user => {:include => :community_events }]
        else
            render json: { error: 'failed to add event' }, status: :not_acceptable
        end
        
    end 

    private

    def user_event_params
        params.require(:user_event).permit(:user_id, :community_event_id)
    end 
end
