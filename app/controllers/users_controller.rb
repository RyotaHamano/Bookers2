class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def edit
    if User.find(params[:id]) == current_user
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  #フォロー一覧
  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end
  
  #フォロワー一覧
  def followers
    user = User.find(params[:id])
    @users = user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end
