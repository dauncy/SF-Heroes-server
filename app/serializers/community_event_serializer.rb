class CommunityEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, 
  :status, 
  :service_subtype, 
  :service_details, 
  :address, 
  :latitude, 
  :longitude,
  :media_url,
  :sf_data_reference,
  :updated_at
  has_many :comments
  has_many :user_events
  # has_many :users, through: :comments
  has_many :users, through: :user_events
  
end
