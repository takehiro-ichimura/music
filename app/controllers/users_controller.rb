class UsersController < ApplicationController
  def index
  end

  def profile_edit
    @user = User.find_by(id: current_user.id)
  end

  def profile_update
    @user = User.find_by(id: current_user.id)
    user = params.permit(:profile, :blog_url, :twitter, :apple, :spotify)
    @user.update(user)
    flash[:notice] = "プロフィールを更新しました"
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def follow
    @user = User.find_by(id: params[:id])
    @follow = Follow.new(user_id: current_user.id, following_user_id: params[:id])
    @follow.save
  end

  def unfollow
    @user = User.find_by(id: params[:id])
    @follow = Follow.find_by(user_id: current_user.id, following_user_id: params[:id])
    @follow.destroy
  end
end
