class Country < ApplicationRecord
    has_many :cities

    resourcify
end
