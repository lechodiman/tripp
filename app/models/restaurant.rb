class Restaurant < ApplicationRecord
	belongs_to :city
    has_many :reviews, as: :reviewable

    resourcify
end