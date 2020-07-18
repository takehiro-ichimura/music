class StocksController < ApplicationController
  def index
    @stocks = Stock.where(user_id: current_user.id).order(created_at: :desc)
  end

  def create
    @post = Post.find_by(id: params[:id])
    @stock = Stock.new(user_id:current_user.id, post_id: params[:id])
    if @stock
      @stock.save
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @stock = Stock.find_by(post_id: params[:id], user_id: current_user.id)
    if @stock
      @stock.destroy
    end
  end
end
