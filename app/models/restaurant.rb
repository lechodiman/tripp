class Restaurant < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

  	mount_uploader :image, ImageUploader
    resourcify

    def mean	
        if self.reviews.blank?
            0
        else
            average_review = self.reviews.average(:rating).round(2)
        end
    end
end
