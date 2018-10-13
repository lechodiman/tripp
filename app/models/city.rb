class City < ApplicationRecord
    belongs_to :country
    has_many :hotels
    has_many :citywalks
    has_many :restaurants
    has_many :reviews, as: :reviewable


    VALID_NAME_REGEX = /\A[a-zA-Z ]+\z/
  	validates :name, presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: { case_sensitive: false }
  	validates :description, presence: true

    mount_uploader :image, ImageUploader

    resourcify

end
