module Api
  module V1
    class UsersController < ApplicationController

      def show
      end

      def create
      end

      def destroy
      end

      private

      def find_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
    end
  end
end
