class Chapter < ActiveRecord::Base
    belongs_to :story
    has_many :votes, dependent: :destroy
end
