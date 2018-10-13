class Review < ApplicationRecord
    belongs_to :reviewable, polymorphic: true
    belongs_to :user
    validates :body, presence: true
    acts_as_votable

    resourcify
end
