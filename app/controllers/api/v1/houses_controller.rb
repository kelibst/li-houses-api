module Api
  module V1
    class HousesController < ApplicationController
      before_action :set_house, only: %i[show update destroy]
      before_action :authenticate_user, except: %i[index show]

      # GET /houses
      # GET /houses.json
      def index
        @houses = House.all.ordered_by_most_recent
      end

      # GET /houses/1
      # GET /houses/1.json
      def show; end

      # POST /houses
      # POST /houses.json
      def create
        @house = House.new(house_params)

        if @house.save
          render :show, status: :created
        else
          render json: @house.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /houses/1
      # PATCH/PUT /houses/1.json
      def update
        if current_user === @house.user || current_user.isAdmin
          if @house.update(house_params)
            render :show, status: :ok
          else
            render json: @house.errors, status: :unprocessable_entity
          end
        else
          render json: 'You do not have permission to perform that action!', status: :unprocessable_entity
        end
      end

      # DELETE /houses/1
      # DELETE /houses/1.json
      def destroy
        if current_user === @house.user || current_user.isAdmin
          @house.destroy
        else
          render json: 'You do not have permission to perform that action!', status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_house
        @house = House.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def house_params
        params.require(:house).permit(:name, :country, :address, :image, :slug, :status, :region, :location, :user_id)
      end
    end
  end
end
