class Hotels::ReviewsController < ReviewsController
    before_action :set_reviewable, only: [:new, :create, :update]

    private
        def set_reviewable
            @reviewable = Citywalk.find(params[:citywalk_id])
        end

end