class City < ApplicationRecord
    belongs_to :country
    has_many :hotels
    has_many :citywalks
    has_many :reviews, as: :reviewable

    VALID_USERNAME_REGEX = /\A[a-zA-Z ]+\z/
  	validates :name, presence: true, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
end
