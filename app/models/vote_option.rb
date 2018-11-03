class VoteOption < ApplicationRecord
    belongs_to :poll
    validates :title, presence: true
    has_many :poll_votes, dependent: :destroy
    has_many :users, through: :poll_votes
end
