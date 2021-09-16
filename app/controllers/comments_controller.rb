class CommentsController < ApplicationController
   before_action :require_user_logged_in
  def new
     @comment = Comment.new
  end
  
  def create
     @comment = Comment.new(comment_params)
     @comment.user_id = current_user.id
     logger.debug @comment.errors.inspect 
    if @comment.save
     redirect_back(fallback_location: root_path)
    else
      @comments = Comment.all
      redirect_back(fallback_location: root_path)
    end
  end
  
private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end