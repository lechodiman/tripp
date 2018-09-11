class HotelsController < ApplicationController
  before_action :find_city	
  before_action :find_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
  end

  def new
  	  @hotel = Hotel.new
  end

  def show
  end

  def update
  	 if @hotel.update(hotel_params)
            redirect_to hotel_path(@hotel)
        else
            render 'edit'
        end
    
  end

  def destroy
        @hotel.destroy
        redirect_to city_path(@city)
  end


  def create
  	@hotel = Hotel.new(hotel_params)
    @hotel.city_id = @city.id

    if @hotel.save
        flash[:success] = "Hotel created successfully!"
        redirect_to country_city_path(@city.country, @city)
    else
        render 'new'
    end
   end
   private
        def hotel_params
            params.require(:hotel).permit(:name, :description)
        end

        def find_city
            @city = City.find(params[:city_id])
        end

        def find_hotel
            @hotel = Hotel.find(params[:id])
   end


end
