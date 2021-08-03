class PostsController < ApplicationController
before_action :set_q, only: [:index, :search]
  def index
        @posts = Post.all.page(params[:page]).per(6).order("id DESC")
        @post = Post.new
         
  end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)

    if @post.save
      flash[:success] = '正常に投稿されました'
      redirect_to root_path
    else
      flash.now[:danger] = '投稿に失敗しました'
      redirect_to root_path
    end
        
    end
    
    def search
      @results = @q.result.order("id DESC")
    end

    
    private
    
    
    
    def set_q
      @q = Post.ransack(params[:q])
    end


  # Strong Parameter
  def post_params
    params.require(:post).permit(:shopname, :shopaddress, :shopcontent)
  end
end
