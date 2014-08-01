class Chapter < ActiveRecord::Base
    belongs_to :story
    belongs_to :chapter
    has_many :votes, dependent: :destroy
    has_many :upvoted_users, through: :votes, source: :user
end
