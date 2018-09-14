class City < ApplicationRecord
    belongs_to :country
    has_many :hotels
    has_many :citywalks
    has_many :reviews, as: :reviewable
end
