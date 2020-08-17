class Recipe < ApplicationRecord
    has_many :modified_recipes, class_name: "Recipe", foreign_key: "starter_recipe_id"
    belongs_to :starter_recipe, class_name: "Recipe", optional: true
    belongs_to :user, optional: true
    has_and_belongs_to_many :tags
    has_many :user_recipes
  

    def cuisines
        # All cuisine tags for a certain recipe
        self.tags.where(cuisine?: true)
    end

    def dietary_tags
        # All dietary tags for a certain recipe
        self.tags.where(dietary?: true)
    end

    def reviews
        UserRecipe.where(recipe_id:  self.id).where.not(review: nil)
    end 

    def self.japanese
        #Go through all recipes
        #Find those with tags name: "Japanese"
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Japanese"})
    end

    def self.vegetarian
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Vegetarian"})
    end

    def self.italian
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Italian"})
    end

    def self.korean
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Korean"})
    end

    def self.gf
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Gluten-Free"})
    end

    def self.df
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Dairy-Free"})
    end

    def self.all_modified
        Recipe.where(is_starter?: false)
    end

    def self.indian
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Indian"})
    end
end
