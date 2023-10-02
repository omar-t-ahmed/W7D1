class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new,:create] 
    before_action :require_logged_in, only: [:index,:show,:update,:edit]

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
        
        if @user.save
            login(@user)
            redirect_to cats_url(@user)
        else 
            render json: @user.errors.full_messages
        end
    end

    private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end