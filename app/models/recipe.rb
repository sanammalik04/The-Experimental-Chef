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
        UserRecipe.where(recipe_id:  self.id).where.not(rating: nil)
    end 

    def average_rating
        avg = self.reviews.average(:rating).to_f
    end

    def self.top_five
        # Go through recipes that have reviews
        recipes = []
        Recipe.all.each do |recipe|
            if recipe.reviews.any? 
                recipes << recipe
            end
        end
        recipes.max_by(4) do |recipe|
            recipe.average_rating
        end
    end

    def self.japanese
        #Go through all recipes
        #Find those with tags name: "Japanese"
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Japanese"}).limit(4)
    end

    def self.vegetarian
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Vegetarian"}).limit(4)
    end

    def self.italian
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Italian"}).limit(4)
    end

    def self.korean
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Korean"}).limit(4)
    end

    def self.gf
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Gluten-Free"}).order("RANDOM()").limit(4)
    end

    def self.df
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Dairy-Free"}).limit(4)
    end

    def self.all_modified
        Recipe.where(is_starter?: false).limit(4)
    end

    def self.indian
        Recipe.joins(recipes_tags: :tag).where(tags:{name: "Indian"}).limit(4)
    end

    def self.alphabetized
        Recipe.order('lower(name) ASC').all
    end

    def self.search(search)
        if search
            search = search.titleize
            if Tag.find_by(name: search)
                tag_name = Tag.find_by(name: search).name
                Recipe.joins(recipes_tags: :tag).where(tags:{name: tag_name})
            else 
                return 0
            end
        end
    end 

end
