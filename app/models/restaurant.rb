class Restaurant < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

  	mount_uploader :image, ImageUploader
    resourcify
end
