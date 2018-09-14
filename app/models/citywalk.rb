class Citywalk < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

end
