class PostsController < ApplicationController
  before_action :sign_in_required, only: [:new, :edit, :update, :destroy]

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
  end

  def new
    @post = Post.new
    if params[:album_id]
      @album = Album.find(params[:album_id])
      @artist = Artist.find(params[:artist_id])
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
    end
  end

  def create
    @post = Post.new(
      title: params[:title],
      summary: params[:summary],
      content: params[:content],
      user_id: params[:user_id],
      score: params[:score],
      album_id: params[:album_id],
      artist_id: params[:artist_id]
    )
    if @post.save
      flash[:notice] = "投稿成功"
      if params[:album_id]
        redirect_to("/artists/#{params[:artist_id]}/albums/#{params[:album_id]}")
      else
        redirect_to("/artists/#{params[:artist_id]}")
      end
    else
      if params[:album_id]
        @album = Album.find_by(id: params[:album_id])
        @artist = Artist.find_by(id: params[:artist_id])
        #render("artists/#{params[:artist_id]}/albums/#{params[:album_id]}/new")
        render :new
      else
        @artist = Artist.find_by(id: params[:artist_id])
        #render("artists/#{params[:artist_id]}/new")
        render :new
      end
    end
  end
end
