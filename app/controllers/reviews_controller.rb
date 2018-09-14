class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
        @review = @reviewable.reviews.new(review_params)
        @review.user = current_user
        @review.save

        redirect_to root_path, notice: "Your comment was successfully posted"
    end

    private
        def review_params
            params.require(:review).permit(:body)
        end

end
