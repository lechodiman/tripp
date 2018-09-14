class Hotel < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable
end
