class City < ApplicationRecord
    belongs_to :country
    has_many :hotels
    has_many :citywalks
end
