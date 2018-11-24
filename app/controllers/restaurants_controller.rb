class RestaurantsController < ApplicationController
    before_action :find_city, only: [:new, :create, :index]
    before_action :find_restaurant, only: [:show, :edit, :update, :destroy, :saved, :unsaved]
    before_action :authenticate_user!, only: [:new, :edit, :saved, :unsaved]

    def index
        @restaurants = Restaurant.where(city_id: @city.id)
                                 .paginate(page: params[:page], per_page: 3)
    end

    def new
        @restaurant = Restaurant.new
    end

    def show
        if @restaurant.reviews.blank?
            @average_review = 0
        else
            @average_review = @restaurant.reviews.average(:rating).round(2)
        end
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
        redirect_back(fallback_location: root_path)
    end

    def unsaved
        @restaurant.unsave_by current_user
        redirect_back(fallback_location: root_path)
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
