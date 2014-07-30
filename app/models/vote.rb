class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :chapter
    validates_uniqueness_of :chapter_id, scope: :user_id

end
