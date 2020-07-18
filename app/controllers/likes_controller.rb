class LikesController < ApplicationController
  def index
    @likes = Like.where(user_id: current_user.id).order(created_at: :desc)
  end

  def create
    @like = Like.new(user_id:current_user.id, post_id: params[:id], point: 1+2*Math.log(1+current_user.posts.count).floor)
    @like.save
    @post = Post.find_by(id: params[:id])
    @post.point +=  @like.point
    @post.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:id], user_id: current_user.id)
    @post = Post.find_by(id: params[:id])
    @post.point -=  @like.point
    @post.save
    @like.destroy
    #redirect_back(fallback_location: root_path)
  end
end
