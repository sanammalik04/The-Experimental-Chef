class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create

    def login
    

    end

    def process_login
        @user = User.find_by(user_name: params[:user_name])
        if @user
            session[:user_id] = @user.id
            redirect_to recipes_path
        else
            flash.now[:login_error] = "Invalid User Name"
            render :login
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

end
