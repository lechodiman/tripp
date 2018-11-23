module UsersHelper
    def can_moderate_review(review)
        if current_user && current_user.country_id
            review.reviewable.city.country.id == current_user.country_id
        else
            false
        end
    end
end
