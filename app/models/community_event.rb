class CommunityEvent < ApplicationRecord
    has_many :user_events
    has_many :comments
    has_many :users, through: :user_evets
end