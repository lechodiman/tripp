class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_review, only: [:edit, :update, :destroy, :upvote]

    def create
        @review = @reviewable.reviews.new(review_params)
        @review.user = current_user
        @review.save

        redirect_to @reviewable, notice: 'Your review was successfully posted!'
    end

    def destroy
        this_reviewable = @review.reviewable
        @review.destroy
        redirect_to this_reviewable
    end

    def edit
    end

    def update
        this_reviewable = @review.reviewable
        if @review.update(review_params)
            redirect_to this_reviewable
        else
            render 'edit'
        end
    end

    def upvote
        @review.upvote_by current_user
        redirect_to :back        
    end

    private

    def review_params
        params.require(:review).permit(:body, :rating)
    end

    def find_review
        @review = Review.find(params[:id])
    end


    def downvote
        @review = Review.find(params[:id])
        @review.downvote_by current_user
        redirect_to :back        
    end

end
