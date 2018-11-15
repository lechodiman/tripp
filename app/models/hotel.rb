class Hotel < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

    VALID_USERNAME_REGEX = /\A[a-zA-Z ]+\z/
  	validates :name, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  	validates :description, presence: true

  	mount_uploader :image, ImageUploader

  	resourcify
end
