class Listing < ApplicationRecord
    belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
    has_many :favorites
    has_many :followers, :through => :favorites, :source => :user
end
