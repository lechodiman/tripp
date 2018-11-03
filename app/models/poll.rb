class Poll < ApplicationRecord
    has_many :vote_options, dependent: :destroy
    validates :topic, presence: true
    # :reject_if => :all_blank raises an error and rejects
    # saving the poll if it has no vote options

    # :allow_destroy => true allows users to delete vote
    # options through nested attributes
    accepts_nested_attributes_for :vote_options, reject_if: :all_blank,
                                                 allow_destroy: true
end
