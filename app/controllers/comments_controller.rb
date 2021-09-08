class CommentsController < ApplicationController
  
  def new
        @comment = Comment.new
  end
  def create
     @comment = Comment.new(comment_params)
     @comment.user_id = current_user.id
     @comment.post_id = current_post.id
     logger.debug @comment.errors.inspect 
    if @comment.save
      redirect_to post_comments_path
    else
      @comments = Comment.all
      redirect_back(fallback_location: root_path)
    end
  end
  
private
  def comment_params
    params.require(:comment).permit(:content)
  end
end