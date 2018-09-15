class CitywalksController < ApplicationController
  before_action :find_city, only: [:new, :create]
  before_action :find_citywalk, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
  end

  def new
  	@citywalk = Citywalk.new
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
        flash[:success] = "Citywalk created successfully!"
        redirect_to city_path(@city)
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
