class SessionsController < ApplicationController
    @user = User.find_by_credentials?(params[:user][:username], params[:user][:password])
    
    def new
        render :new
    end

    def create
        @user.reset_session_token! 
        session[:session_token] = @user.session_token
        redirect_to cats_url
    end

end
