class User < ApplicationRecord
    has_many :user_recipes
    has_many :recipes
    has_one :cookbook
    
end
