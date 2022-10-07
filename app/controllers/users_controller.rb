class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid


    def create
        users = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        end
    end


    private
    def render_invalid(invalid)
        render json:{error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
