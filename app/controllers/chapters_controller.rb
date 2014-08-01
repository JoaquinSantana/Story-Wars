class ChaptersController < ApplicationController

    def create
        @story = Story.find(params[:story_id])
        @chapter = @story.chapters.create(chapter_params)
        redirect_to story_path(@story), notice: 'Thank you for adding your chapter! Voting will begin soon.'
    end

    def destroy
        @story = Story.find(params[:story_id])
        @chapter = @story.chapters.find(params[:id])
        @chapter.destroy
        redirect_to story_path(@story)
    end

    #def upvote
    #    @chapter = Chapter.find(params[:id])
    #    @chapter.votes.create
    #    flash[:notice] = 'Thank you for voting!'
    #    redirect_to(:back)
        #if session[:has_counted_view] == nil
        #    @chapter = Chapter.find(params[:id])
        #    @chapter.votes.create
        #    flash[:notice] = 'Thank you for voting!'
        #    redirect_to(:back)
        #    session[:has_counted_view] = true
        #else 
        #    flash[:notice] = 'You have already voted for this chapter'
        #    redirect_to(:back)
        #end
    #end

    def upvote
        @chapter = Chapter.find(params[:id])

        if @chapter.votes.create(user_id: current_user.id)
            flash[:notice] =  "Thank you for voting! The voting will soon be ended."
            redirect_to(:back)
        else 
            flash[:notice] =  "You have already voted for this!"
            redirect_to(:back)
        end
    end
 
    private
        def chapter_params
            params.require(:chapter).permit(:round, :author, :authorname, :body, :user_id)
        end
end