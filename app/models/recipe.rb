class Recipe < ApplicationRecord
    has_many :modified_recipes, class_name: "Recipe", foreign_key: "starter_recipe_id"
    belongs_to :starter_recipe, class_name: "Recipe", optional: true
    belongs_to :user, optional: true
    has_and_belongs_to_many :tags

    def cuisines
        self.tags.where(cuisine?: true)
    end

    def dietary_tags
        self.tags.where(dietary?: true)
    end
end
