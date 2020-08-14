class Recipe < ApplicationRecord
    has_many :modified_recipes, class_name: "Recipe", foreign_key: "starter_recipe_id"
    belongs_to :starter_recipe, class_name: "Recipe", optional: true
    belongs_to :user

end
