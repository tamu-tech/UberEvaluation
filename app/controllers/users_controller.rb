class UsersController < ApplicationController
  def index
    binding.pry
     @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to posts_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
