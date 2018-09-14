class Hotels::ReviewsController < ReviewsController
    before_action :set_reviewable

    private
        def set_reviewable
            @reviewable = Hotel.find(params[:hotel_id])
        end

end