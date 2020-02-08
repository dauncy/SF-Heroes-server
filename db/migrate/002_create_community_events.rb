class CreateCommunityEvents < ActiveRecord::Migration[6.0]
    def change
      create_table :community_events do |t|
        
        t.integer :sf_data_reference
        t.string :district
        t.string :title 
        t.string :status 
        t.string :service_subtype
        t.string :service_details
        t.string :address
        t.float :latitude
        t.float :longitude
        t.string :media_url 
  
        t.timestamps
      end
    end
  end