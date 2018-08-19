class CountriesController < ApplicationController
    before_action :find_country, only: [:show, :edit, :update, :destroy]


	def index
		@countries = Country.all.order("created_at DESC")
	end 

	def show
		
	end

	def new
		@country = Country.new
	end

	def create
	   @country = Country.new(country_params)

		if @country.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @country.update(country_params)
			redirect_to country_path(@country)
		else
			render 'edit'
		end
	end

	def destroy
		@country.destroy
		redirect_to root_path
	end

	private

		def country_params
			params.require(:country).permit(:name, :description)
		end

        def find_country
            @country = Country.find(params[:id])            
        end


end
