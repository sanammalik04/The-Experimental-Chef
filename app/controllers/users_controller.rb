class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @user_saved_recipes = @user.saved_recipes
    end 
end
