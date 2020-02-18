class User < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :user_events, dependent: :destroy 
    has_many :community_events, through: :user_events

    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    has_secure_password
end
