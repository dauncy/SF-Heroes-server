class UserEvent < ApplicationRecord
    belongs_to :user
    belongs_to :community_event
end
