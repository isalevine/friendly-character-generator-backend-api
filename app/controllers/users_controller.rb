class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid?
            render json: @user, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :email, :bio)
    end
        
end
