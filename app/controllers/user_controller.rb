class UserController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
       render json: { user: current_user }, status: :accepted
    end


    def index
        users = User.all 
        render json: users
    end 

    def show
        user = User.find(params[:id])
        render json: user
    end 

    def create 
        user = User.create(user_params)

        if user.valid?
            @token = encode_token(user_id: user.id)
            render json: { user: user, jwt: @token }, status: :created
        else 
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end

    
    end 

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end 

    def destroy
        user = user.find(params[:id])
        user.destroy
        
    end 

    private 

    def user_params
        params.require(:user)
        .permit(:username, :name, :password, :password_confirmation)
    end 
end
