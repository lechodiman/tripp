class City < ApplicationRecord
    belongs_to :country
    has_many :hotels
    has_many :citywalks
    has_many :restaurants
    has_many :reviews, as: :reviewable
    mount_uploader :image, ImageUploader
end
