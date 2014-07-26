class Story < ActiveRecord::Base
    belongs_to :user
    has_many :chapters
    default_scope -> { order('created_at DESC') }
    validates :title, presence: true, length: { maximum: 25 }
    validates :content, presence: true, length: { maximum: 2000 }
    validates :user_id, presence: true

    def timeLeft
        if (self.created_at > 16.hour.ago)
            timeLeft = ((Time.parse(DateTime.now.to_s) - Time.parse(self.created_at.to_s))/3600) - ((Time.parse(DateTime.now.to_s) - Time.parse(self.created_at.to_s))/3600).floor
            timeLeft = (60 - (60 * timeLeft)).ceil
            timeLeft = Time.now + timeLeft.minutes
            timeLeft = timeLeft.strftime("%Y/%m/%d %H:%M:%S")
        else 
            timeLeft = false
        end
    end

    def mostVoted
        allStories = Story.all
        allStories.each do |story|
            votes = 0
            story.chapters.each do |chapter|
                votes = votes + chapter.votes.count
            end
        end
    end
end
