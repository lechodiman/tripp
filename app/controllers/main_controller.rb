class MainController < ApplicationController
    def index
    end

    def search
        render json: { countries: [], cities: [] }
    end
end
