class CityController < ApplicationController
    before_action :set_city, only: [:show, :update, :destroy]

    def index
        @cities = City.all
    end

    def create
        @city = City.new(city_params)
        if @city.save
            render :show, status: :created, location: @city
        else
            render json: @city.errors, status: :unprocessable_entity
        end
    end

    private
        def set_city
            @city = City.find(params[:id])
        end
        def city_params
            params.require(:city).permit(:code, :name, :departmentcode)
        end
end
