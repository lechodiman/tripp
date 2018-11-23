class RestaurantsController < ApplicationController
    before_action :find_city, only: [:new, :create, :index]
    before_action :find_restaurant, only: [:show, :edit, :update, :destroy, :saved]
    before_action :authenticate_user!, only: [:new, :edit, :saved]

    def index
        @restaurants = Restaurant.where(city_id: @city.id)
                                 .paginate(page: params[:page], per_page: 3)
    end

    def new
        @restaurant = Restaurant.new
    end

    def update
        if @restaurant.update(restaurants_params)
            redirect_to restaurant_path(@restaurant)
        else
            render 'edit'
        end
    end

    def destroy
        this_city = @restaurant.city
        @restaurant.destroy
        redirect_to city_path(this_city)
    end

    def create
        @restaurant = Restaurant.new(restaurants_params)
        @restaurant.city_id = @city.id

        if @restaurant.save
            flash[:success] = 'restaurant created successfully!'
            redirect_to city_path(@city)
        else
            render 'new'
        end
    end

    def saved
        @restaurant.upsaved_by current_user
        redirect_to restaurant_path(@restaurant)
    end


    private

    def restaurants_params
        params.require(:restaurant).permit(:name, :description, :image)
    end

    def find_city
        @city = City.find(params[:city_id])
    end

    def find_restaurant
        @restaurant = Restaurant.find(params[:id])
    end
end
