class PostsController < ApplicationController
   before_action :require_user_logged_in
before_action :set_q, only: [:index, :search]

  def index
        @posts = Post.all.page(params[:page]).per(10).order("id DESC")
        @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end
    
  def new
        @post = Post.new
  end
    
    def create
       @post = Post.new(post_params)
       @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
       @q = Post.ransack(params[:q])
        @posts = Post.all.page(params[:page]).per(6).order("id DESC")
      render action: :index
    end
        
    end
    
    def search
      @results = @q.result.order("id DESC")
      @posts = Post.all.page(params[:page]).per(10).order("id DESC")
    end

    
    private
    
    
    
    def set_q
      @q = Post.ransack(params[:q])
    end


  # Strong Parameter
  private
  def post_params
    params.require(:post).permit(:shopname, :shopaddress, :shopcontent)
  end
end
