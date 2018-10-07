class Country < ApplicationRecord
    has_many :cities

    VALID_USERNAME_REGEX = /\A[a-zA-Z ]+\z/
  	validates :name, presence: true, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  	validates :description, presence: true

    resourcify
end
