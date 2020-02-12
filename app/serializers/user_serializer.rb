class UserSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :username, :name, :id
  has_many :user_events
  has_many :community_events, through: :user_events
end
