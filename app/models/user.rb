class User < ApplicationRecord
    has_many :user_recipes
    has_many :recipes
    
    def saved_recipes
        user_recipes = UserRecipe.where(user_id: self.id, saved: true)
        user_recipes.map do |urecipe|
            urecipe.recipe
        end
    end

    
end
