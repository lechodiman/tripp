class Country < ApplicationRecord
    has_many :cities
    mount_uploader :image, ImageUploader

    resourcify
end
