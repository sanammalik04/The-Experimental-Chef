class UsersController < ApplicationController
    
    before_action :authorized, only: [:show]
    
    def show
        @user = User.find(params[:id])
        @user_saved_recipes = @user.saved_recipes
        @user_grocery_list = @user.grocery_list

    end 

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid? 
            @user.save
            session[:user_id]= @user.id
            redirect_to recipes_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation)
    end




end
