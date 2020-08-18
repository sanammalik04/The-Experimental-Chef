class RecipesController < ApplicationController

    def index
        @recipes = Recipe.where(is_starter?: true)
        @japanese = Recipe.japanese
        @vegetarian = Recipe.vegetarian
        @italian = Recipe.italian
        @korean = Recipe.korean
        @gf = Recipe.gf
        @df = Recipe.df
        @modified_recipes = Recipe.all_modified
        @indian = Recipe.indian
        @top_five = Recipe.top_five
        @rec_recipes = current_user.recommended_recipes
        @all_types = [
            {type: @rec_recipes,
            type_name: "Recommended Recipes Based on Your Interest In #{current_user.most_frequent_tag}"},
            { type: @top_five,
            type_name: "Top Rated"},
            { type: @japanese,
            type_name: "Japanese"},
            { type: @italian,
            type_name: "Italian"},
            { type: @korean,
            type_name: "Korean"},
            { type: @indian,
            type_name: "Indian"},
            { type: @gf,
            type_name: "Gluten-Free"},
            { type: @df,
            type_name: "Dairy-Free"},
            { type: @modified_recipes,
            type_name: "User-Created"},
        ]
    end

    def show
        @recipe = Recipe.find(params[:id])
        @ingredients_lines = @recipe.ingredients.split("\n")
        @steps = @recipe.instructions.split("\n")
        @recipe_cuisines = @recipe.cuisines
        @dietary_tags = @recipe.dietary_tags
        if @recipe.is_starter? == false &&
            @recipe.chef_name == nil
            @recipe.chef_name = @recipe.user.name
        end
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
        params.require(:recipe).permit(:starter_recipe_id, :name, :description, :image_url, :serving_size, :calorie_count, :instructions, :chef_name, :user_id, :ingredients, :tag_ids => []).with_defaults(is_starter?: false)
    end



end
