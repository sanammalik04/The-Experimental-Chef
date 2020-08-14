class RecipesController < ApplicationController

    def index
        @recipes = Recipe.where(is_starter?: true)
    end

    def show
        @recipe = Recipe.find(params[:id])
        @steps = @recipe.instructions.split("\n")
    end

    def new
    @recipe = Recipe.new
    end

    def create
        recipe = Recipe.create(recipe_params)
        redirect_to recipe_path(recipe)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:starter_recipe_id, :name, :description, :image_url, :serving_size, :calorie_count, :instructions, :is_starter, :chef_name)
    end



end
