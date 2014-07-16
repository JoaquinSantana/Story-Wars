class Story < ActiveRecord::Base
    belongs_to :user
    has_many :chapters
    default_scope -> { order('created_at DESC') }
    validates :title, presence: true, length: { maximum: 25 }
    validates :content, presence: true, length: { maximum: 2000 }
    validates :user_id, presence: true
end
