class PollVote < ApplicationRecord
  belongs_to :user
  belongs_to :vote_option
end
