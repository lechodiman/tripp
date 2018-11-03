class CitiesController < ApplicationController
    before_action :find_country, only: [:new, :create]
    before_action :find_city, only: [:show, :edit, :update, :destroy,:saved]
    before_action :authenticate_user!, only: [:new, :edit]

    def show
    end

    def new
        @city = City.new
    end

    def create
        @city = City.new(city_params)
        @city.country_id = @country.id

        if @city.save
            flash[:success] = 'City created successfully!'
            redirect_to country_path(@country)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @city.update(city_params)
            redirect_to city_path(@city)
        else
            render 'edit'
        end
    end

    def destroy
        this_country = @city.country
        @city.destroy
        redirect_to country_path(this_country)
    end

    def saved
        @city.upsaved_by current_user
        redirect_to city_path(@city)
    end

    private

    def city_params
        params.require(:city).permit(:name, :description, :image)
    end

    def find_country
        @country = Country.find(params[:country_id])
    end

    def find_city
        @city = City.find(params[:id])
    end
end
