class Restaurants::ReviewsController < ReviewsController
    before_action :set_reviewable, only: [:new, :create]

    private

    def set_reviewable
        @reviewable = Restaurant.find(params[:restaurant_id])
    end
end
