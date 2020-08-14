class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create

    def new

    end

    def create
        session[:user_name]= params[:user_name]
        redirect_to user_path()
    end
end
