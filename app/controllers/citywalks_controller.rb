class CitywalksController < ApplicationController
    before_action :find_city, only: [:new, :create, :index]
    before_action :find_citywalk, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]

    def index
        @citywalks = Citywalk.where(city_id: @city.id)
                             .paginate(page: params[:page], per_page: 3)
    end

    def new
        @citywalk = Citywalk.new
    end

    def show
        if @citywalk.reviews.blank?
            @average_review = 0
        else
            @average_review = @citywalk.reviews.average(:rating).round(2)
        end
    end

    def update
        if @citywalk.update(citywalks_params)
            redirect_to citywalk_path(@citywalk)
        else
            render 'edit'
        end
    end

    def destroy
        this_city = @citywalk.city
        @citywalk.destroy
        redirect_to city_path(this_city)
    end

    def create
        @citywalk = Citywalk.new(citywalks_params)
        @citywalk.city_id = @city.id

        if @citywalk.save
            flash[:success] = 'Citywalk created successfully!'
            redirect_to city_path(@city)
        else
            render 'new'
        end
    end

    private

    def citywalks_params
        params.require(:citywalk).permit(:name, :description, :duration, :place)
    end

    def find_city
        @city = City.find(params[:city_id])
    end

    def find_citywalk
        @citywalk = Citywalk.find(params[:id])
    end
end
