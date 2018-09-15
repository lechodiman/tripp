class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_review, only: [:show, :edit, :update, :destroy]

    def create
        @review = @reviewable.reviews.new(review_params)
        @review.user = current_user
        @review.save

        redirect_to @reviewable, notice: "Your review was successfully posted!"
    end

    def destroy
        @review.destroy
        redirect_to root_path
    end

    def edit
        
    end

    def update
        if @review.update(review_params)
          redirect_to root_path
        else
          render 'edit'
        end 
    end

    private
        def review_params
            params.require(:review).permit(:body)
        end

        def find_review
            @review = Review.find(params[:id])
        end
end
