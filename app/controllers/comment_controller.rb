class CommentController < ApplicationController

    def index
        comments = Comment.all 
        render json: comments
    end 

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end 

    def create
        comment = Comment.create(comment_params)
        render json: comment
    end 

    def destroy
        comment = Comment.find(params[:id])
    end 

    private

    def comment_params
        params.require(:comment).permit(:user_id, :community_event_id, :content)
    end 
end
