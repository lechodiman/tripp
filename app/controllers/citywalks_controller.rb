class CitywalksController < ApplicationController
  before_action :find_city  
  before_action :find_citywalk, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
  end

  def new
  	@citywalk = Citywalk.new
  end

  def update
    if @citywalk.update(citywalk_params)
      redirect_to country_city_citywalk_path(@citywalk.city.country, @citywalk.city , @citywalk)
    else
      render 'edit'
    end    
  end

  def destroy
    @citywalk.destroy
    redirect_to root_path
  end

  def create
    @citywalk = Citywalk.new(hotel_params)
    @citywalk.city_id = @city.id

    if @citywalk.save
        flash[:success] = "Citywalk created successfully!"
        redirect_to country_city_path(@city.country, @city)
    else
        render 'new'
    end
  end

  private
        def citywalks_params
            params.require(:citywalk).permit(:name, :description,:duration, :place)
        end

        def find_city
            @city = City.find(params[:city_id])
        end

        def find_citywalk
            @citywalk = Citywalk.find(params[:id])
        end
end
