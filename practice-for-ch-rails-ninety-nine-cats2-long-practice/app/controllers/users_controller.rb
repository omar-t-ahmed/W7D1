class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        render :new
    end 

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        
        if @user.save!
            redirect_to user_url(@user)
        else 
            render json: @user.error.full_messages
        end
    end

    private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end