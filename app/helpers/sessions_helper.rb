module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def current_post
    @current_post ||= Post.find_by(id: session[:post_id])
  end

  def logged_in?
    !!current_user
  end
end
