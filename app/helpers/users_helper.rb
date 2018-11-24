module UsersHelper
    def can_moderate_review(review)
        if current_user && current_user.country_id
            review.reviewable.city.country.id == current_user.country_id
        else
            false
        end
    end

    def has_favorite_item(item)
        if user_signed_in? && current_user.find_saved_items.include?(item)
            return true
        end
        return false
    end
end
