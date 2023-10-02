class UsersController < ApplicationController
    def new
        render :new
    end 

    def show
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