class RecipesController < ApplicationController

    def index
        @recipes = Recipe.where(is_starter?: true)
    end

    def show
        @recipe = Recipe.find(params[:id])
        @steps = @recipe.instructions.split("\n")
    end
end
