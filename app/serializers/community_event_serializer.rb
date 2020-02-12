class CommunityEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, 
  :status, 
  :service_subtype, 
  :service_details, 
  :address, 
  :latitude, 
  :longitude,
  :media_url,
  :sf_data_reference
  has_many :comments
  has_many :users, through: :comments
end
