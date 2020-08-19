class UserRecipesController < ApplicationController

    before_action :authorized, only: [:new]
    
    def new
 
        @original_recipe = Recipe.find(params[:format])
        @review = UserRecipe.new
        @user = User.first
    end

    def create
        @review = UserRecipe.new(reviews_params)

        if @review.valid?
            @review.save
            recipe_id = params["user_recipe"]["recipe_id"]
            recipe_id = recipe_id.to_i
            recipe = Recipe.find(recipe_id)
            redirect_to recipe_path(recipe)
        else 
            recipe_id = params["user_recipe"]["recipe_id"]
            recipe_id = recipe_id.to_i
            @original_recipe = Recipe.find(recipe_id)
            render :new
        end
    end

    def save
        r_id = params[:id].to_i
        user_recipe = UserRecipe.find_or_create_by(recipe_id: r_id, user_id: current_user.id)
        user_recipe.update(saved: true)
        user_recipe.save
        redirect_to user_path(current_user)
    end

    def add_to_grocery_list
        r_id = params[:id].to_i
        user_recipe = UserRecipe.find_or_create_by(recipe_id: r_id, user_id: current_user.id)
        user_recipe.update(on_grocery_list: true)
        user_recipe.save
        redirect_to user_path(current_user)
    end

    def remove_from_grocery_list
        r_id = params[:id].to_i
        user_recipe = UserRecipe.find_by(recipe_id: r_id, user_id: current_user.id)
        user_recipe.update(on_grocery_list: false)
        user_recipe.save
        redirect_to user_path(current_user)
    end

    def unsave
        all_recipe_ids = params[:recipe][:recipe_ids]
        all_recipe_ids.reject(&:blank?).each do |id|
            user_recipe = UserRecipe.find_by(recipe_id: id, user_id: current_user.id)
            user_recipe.update(saved: false)
            user_recipe.save
        end
            redirect_to user_path(current_user) 
    end




    private

    def reviews_params
        params.require(:user_recipe).permit(:user_id, :recipe_id, :review, :rating, :recipe_ids => [])
    end


end
