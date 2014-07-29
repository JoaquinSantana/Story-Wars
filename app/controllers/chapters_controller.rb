class ChaptersController < ApplicationController

    def create
        @story = Story.find(params[:story_id])
        @chapter = @story.chapters.create(chapter_params)
        redirect_to story_path(@story), notice: 'New chapter created!'
    end

    def destroy
        @story = Story.find(params[:story_id])
        @chapter = @story.chapters.find(params[:id])
        @chapter.destroy
        redirect_to story_path(@story)
    end

    def upvote
        if session[:has_counted_view] == nil
            @chapter = Chapter.find(params[:id])
            @chapter.votes.create
            flash[:notice] = 'Thank you for voting!'
            redirect_to(:back)
            session[:has_counted_view] = true
        end
    end
 
    private
        def chapter_params
            params.require(:chapter).permit(:round, :author, :authorname, :body)
        end
end