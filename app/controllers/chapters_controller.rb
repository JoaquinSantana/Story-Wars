class ChaptersController < ApplicationController

    def create
        @story = Story.find(params[:story_id])
        @chapter = @story.chapters.create(chapter_params)
        redirect_to story_path(@story)
    end

    def destroy
        @story = Story.find(params[:story_id])
        @chapter = @story.chapters.find(params[:id])
        @chapter.destroy
        redirect_to story_path(@story)
    end

    def upvote
        @chapter = Chapter.find(params[:id])
        @chapter.votes.create
        redirect_to(:back)
    end
 
    private
        def chapter_params
            params.require(:chapter).permit(:round, :author, :authorname, :body)
        end
end