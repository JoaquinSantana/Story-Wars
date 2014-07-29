class Story < ActiveRecord::Base
    belongs_to :user
    has_many :chapters
    default_scope -> { order('created_at DESC') }
    validates :title, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 2000 }
    validates :user_id, presence: true

    def timeLeft
        if (self.created_at > 16.hour.ago)
            timeLeft = ((Time.parse(DateTime.now.to_s) - Time.parse(self.created_at.to_s))/3600) - ((Time.parse(DateTime.now.to_s) - Time.parse(self.created_at.to_s))/3600).floor
            timeLeft = (60 - (60 * timeLeft)).ceil
            #timeLeft = Time.now + timeLeft.minutes
            #timeLeft = timeLeft.strftime("%Y/%m/%d %H:%M:%S")
        else 
            timeLeft = false
        end
    end

    def self.most_voted
        Story.all.sort_by do |story|
            story.chapters.map do |chapter| 
                chapter.votes.count
            end.reduce(0, :-)
        end
    end

end
