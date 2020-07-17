class PostsController < ApplicationController
  before_action :sign_in_required, only: [:new, :edit, :update, :destroy]

  def show
    @post = Post.find_by(id: params[:id])
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
    if params[:score] == "nil"
      score = nil
    else
      score = params[:score]
    end
    @post = Post.new(
      title: params[:title],
      summary: params[:summary],
      content: params[:content],
      user_id: params[:user_id],
      score: score,
      album_id: params[:album_id],
      artist_id: params[:artist_id]
    )
    if @post.save
      flash[:notice] = "投稿しました"
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

  def edit
    if params[:album_id]
      @album = Album.find_by(id: params[:album_id])
      @artist = Artist.find_by(id: params[:artist_id])
    else
      @artist = Artist.find_by(id: params[:artist_id])
    end
    @post = Post.find_by(params[:id])
  end

  def update
    if params[:score] == "nil"
      score = nil
    else
      score = params[:score]
    end
    @post = Post.find_by(id: params[:id])
    if @post.update(
      title: params[:title],
      summary: params[:summary],
      content: params[:content],
      user_id: params[:user_id],
      score: score,
      album_id: params[:album_id],
      artist_id: params[:artist_id]
    )
      flash[:notice] = "投稿を更新しました"
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
