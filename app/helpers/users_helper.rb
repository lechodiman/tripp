module UsersHelper

	def can_moderate_review(review)

		review.reviewable.city.country.id == current_user.country_id

	end

end
