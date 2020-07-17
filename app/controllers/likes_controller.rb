class LikesController < ApplicationController
  def index
    @likes = Like.where(user_id: current_user.id).order(created_at: :desc)
  end
end
