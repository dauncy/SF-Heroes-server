class CommunityEventController < ApplicationController

    def index
       
            community_events = CommunityEvent.where(nil)
            filtering_params(params["community_event"]).each do |key, value|
                community_events = community_events.public_send(key, value) if value.present?
              end
        
       
        
        render json: community_events
    end 

    def show
        community_event = CommunityEvent.find(params[:id])
        render json: community_event
    end 

    def create
        community_event = CommunityEvent.create(community_event_params)
        render json: community_event
    end 

    def update
        community_event = Community_event.find(params[:id])
        community_event.update(community_event_params)
        render json: community_event 
    end 



    private
    
    def community_event_params
        params.require(:community_event)
        .permit(:title, 
                :status, 
                :service_subtype, 
                :service_details, 
                :address, 
                :latitude, 
                :longitude,
                :media_url)
    end 

    def filtering_params(community_event_params)
        community_event_params.slice(:status, :location, :title, :service_subtype)
    end 
end
