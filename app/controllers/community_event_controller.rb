class CommunityEventController < ApplicationController

    def index

           community_events = [ ]
           if params[:title] && params[:district] && params[:status]
                community_events.push(CommunityEvent.where(title: params[:title], district: params[:district], status: params[:status]))
          
           
                elsif params[:district] && params[:title]
                    community_events.push(CommunityEvent.where(district: params[:district], title: params[:title]))
              

                elsif params[:status] && params[:district]
                        community_events.push(CommunityEvent.where(status: params[:status], district: params[:district]))
            
                elsif params[:title] && params[:status]
                    community_events.push(CommunityEvent.where(status: params[:status], title: params[:title]))

                elsif params[:district]
                    community_events.push(CommunityEvent.where(district: params[:district])) 
           
                elsif params[:title]
                    community_events.push(CommunityEvent.where(title: params[:title]))

                elsif params[:status]
                    community_events.push(CommunityEvent.where(status: params[:status]))
                else 
                    community_events.push(CommunityEvent.all)
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

    def query_params
        params.permit(:title, :status, :district)
    end 

    
end
