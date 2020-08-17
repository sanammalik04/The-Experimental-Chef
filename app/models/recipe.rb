class Recipe < ApplicationRecord
    has_many :modified_recipes, class_name: "Recipe", foreign_key: "starter_recipe_id"
    belongs_to :starter_recipe, class_name: "Recipe", optional: true
    belongs_to :user, optional: true
    has_and_belongs_to_many :tags

    def cuisines
        # All cuisine tags for a certain recipe
        self.tags.where(cuisine?: true)
    end

    def dietary_tags
        # All dietary tags for a certain recipe
        self.tags.where(dietary?: true)
    end

    def self.japanese
        #Go through all recipes
        #Find those with tags name: "Japanese"
        Recipe.all.select do |recipe|
            recipe.tags.find_by(name:"Japanese") 
        end
    end
end
