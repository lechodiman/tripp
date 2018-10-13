class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :user

    has_many :comments

    validates :title, presence: true
    validates :content, presence: true
end
