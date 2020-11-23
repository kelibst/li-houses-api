module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :authenticate_user

      def create 
        favorite = user.favorites.new(favorites_params)
        if favorite.save
          render json: favorite, status: :created
        else
          render json: { error: favorite.errors }, status: 422
        end
      end

      def destroy
        @favorite = Favorite.find(params[:id])
        if @favorite.destroy
          head :no_content
        else
          render json: { error: @favorite.errors }, status: 422
        end
      end

      private

      def user
        @user ||= User.find(favorites_params[:user_id])
      end

      def favorites_params
        params.require(:favorite).permit(:user_id, :house_id)
      end
    end
  end
end
