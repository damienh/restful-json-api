module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate, only: [ :destroy ]
      TOKEN = "foobar"

      def show
        @user = find_user
        render json: @user, status: 200
      end

      def create
        @user = User.create(user_params)
        if @user.save
          render json: @user, status: 201
        else
          render json: @user.errors, status: 442
        end
      end

      def destroy
        @user = find_user
        @user.destroy
        head 204
      end

      private

      def authenticate
        authenticate_or_request_with_http_token do |token|
          token == TOKEN
        end 
      end

      def find_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
    end
  end
end
