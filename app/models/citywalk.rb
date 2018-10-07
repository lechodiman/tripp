class Citywalk < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

    VALID_TEXT_REGEX = /\A[a-zA-Z ]+\z/
    NON_EMPTY_REGEX = /\A[.]+\z/
  	validates :name, format: { with: VALID_TEXT_REGEX }, uniqueness: { case_sensitive: false }
  	validates :name, format: { with: NON_EMPTY_REGEX }, uniqueness: { case_sensitive: false }
  	validates :name, format: { with: VALID_TEXT_REGEX }, uniqueness: { case_sensitive: false }

end
