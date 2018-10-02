class Review < ApplicationRecord
    belongs_to :reviewable, polymorphic: true
    belongs_to :user
    acts_as_votable
end
