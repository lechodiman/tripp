class Citywalk < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

    VALID_TEXT_REGEX = /\A[a-zA-Z ]+\z/
  	validates :name, presence: true, format: { with: VALID_TEXT_REGEX }, uniqueness: { case_sensitive: false }
  	validates :description, presence: true
  	validates :place, presence: true, format: { with: VALID_TEXT_REGEX }, uniqueness: { case_sensitive: false }

end
