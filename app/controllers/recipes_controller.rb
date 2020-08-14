class RecipesController < ApplicationController

    def index
        @recipes = Recipe.where(is_starter?: true)
    end

    def show
        @recipe = Recipe.find(params[:id])
        @steps = @recipe.instructions.split("\n")
    end

    def new
        @original_recipe = Recipe.find(params[:format])
        @recipe = Recipe.new
        #change later
        @user = User.first
    end

    def create
        recipe = Recipe.create(recipe_params)
        redirect_to recipe_path(recipe)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:starter_recipe_id, :name, :description, :image_url, :serving_size, :calorie_count, :instructions, :chef_name, :user_id).with_defaults(is_starter?: false)
    end



end
