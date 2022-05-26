class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create, :index]  
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def index   
        render json: User.all, status: :ok
    end

    def show
        render json: @current_user, status: :ok
    end

    def update_balance
        @current_user.update!(balance: params[:balance])
        render json: @current_user, status: :ok
    end

    def update_remainder
        @current_user.update!(remainder: params[:remainder])
        render json: @current_user,  status: :ok
    end


    private

    def user_params
        params.permit(:username, :password)
    end

    def unprocessable_entity_response(invalid)
        render json: {error: "invalid.record.errors.full_messages"}, status: :unprocessable_entity
    end
end
