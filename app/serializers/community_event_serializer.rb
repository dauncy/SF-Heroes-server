class CommunityEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes 
  has_many :comments
  has_many :users, through: :comments
end
