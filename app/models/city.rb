class City < ApplicationRecord
    belongs_to :country
    has_many :hotels
end
