class MainController < ApplicationController
    def index
    end

    def search
        @countries = Country.ransack(name_cont: params[:q]).result(distinct: true)
        @cities = City.ransack(name_cont: params[:q]).result(distinct: true)
        @hotels = Hotel.ransack(name_cont: params[:q]).result(distinct: true)
        @restaurants = Restaurant.ransack(name_cont: params[:q]).result(distinct: true)

        respond_to do |format|
            format.html {}
            format.json {
                @countries = @countries.limit(5)
                @cities = @cities.limit(5)
                @hotels = @hotels.limit(5)
                @restaurants = @restaurants.limit(5)
            }
        end
    end
end
