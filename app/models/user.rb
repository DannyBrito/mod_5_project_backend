class User < ApplicationRecord
    has_many :ownlistings, :class_name => "Listing", :foreign_key => "user_id"
    has_many :favorites
    has_many :favlistings, through: :favorites, source: :listing

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

end
