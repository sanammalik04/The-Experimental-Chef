class UserRecipesController < ApplicationController

    def new
        @original_recipe = Recipe.find(params[:format])
        @review = UserRecipe.new
        @user = User.first
    end

    def create
        review = UserRecipe.create(reviews_params)
        recipe_id = params["user_recipe"]["recipe_id"]
        recipe_id = recipe_id.to_i
        recipe = Recipe.find(recipe_id)
        redirect_to recipe_path(recipe)
    end

    private

    def reviews_params
        params.require(:user_recipe).permit(:user_id, :recipe_id, :review, :rating)
    end


end
