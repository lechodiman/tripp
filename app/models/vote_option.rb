class VoteOption < ApplicationRecord
    belongs_to :poll
    validates :title, presence: true
end
