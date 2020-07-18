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
end
