class Recipe < ApplicationRecord
    has_many :modified_recipes, class_name: "Recipe", foreign_key: "starter_recipe_id"
    belongs_to :starter_recipe, class_name: "Recipe" 
    has_many :user_recipes
    has_many :users, through: :user_recipes
end
