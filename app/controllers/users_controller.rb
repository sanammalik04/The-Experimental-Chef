class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @user
    end 
end
