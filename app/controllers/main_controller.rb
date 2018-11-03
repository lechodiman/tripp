class MainController < ApplicationController
    def index
    end

    def search
        @countries = Country.distinct.where('lower(name) LIKE ?', "%#{params[:q].downcase}%")
        @cities = City.distinct.where('lower(name) LIKE ?', "%#{params[:q].downcase}%")
        @hotels = Hotel.distinct.where('lower(name) LIKE ?', "%#{params[:q].downcase}%")
        @restaurants = Restaurant.distinct.where('lower(name) LIKE ?', "%#{params[:q].downcase}%")

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
