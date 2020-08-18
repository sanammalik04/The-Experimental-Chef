class User < ApplicationRecord
    has_many :user_recipes
    has_many :recipes
    
    def saved_recipes
        user_recipes = UserRecipe.where(user_id: self.id, saved: true)
        user_recipes.map do |urecipe|
            urecipe.recipe
        end
    end

    def grocery_list
        user_recipes = UserRecipe.where(user_id: self.id, on_grocery_list: true)
        
        user_recipes.map do |urecipe|
            {id: urecipe.recipe_id,
            name: urecipe.recipe.name, 
            ingredients: urecipe.recipe.ingredients.split("\n")}
        end
    end


    
end
