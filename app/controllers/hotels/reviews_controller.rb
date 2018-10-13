class Hotels::ReviewsController < ReviewsController
    before_action :set_reviewable, only: [:new, :create]

    private

    def set_reviewable
        @reviewable = Hotel.find(params[:hotel_id])
    end
end
