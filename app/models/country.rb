class Country < ApplicationRecord
    has_many :cities
    mount_uploader :image, ImageUploader

    validates :image, presence: true

    resourcify
end
