class AlbumsController < ApplicationController
  before_action :set_artist, except: [:all_index, :search]
  before_action :set_album, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  before_action :sign_in_required, only: [:new, :edit, :update, :destroy]

  def index
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(albums_params)
    if @album.save
      redirect_to artist_album_path(@artist, @album), notice: "登録完了"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @album.update(albums_params)
      redirect_to artist_album_path(@artist, @album), notice: "登録完了"
    else
      render "new"
    end
  end

  def show
    @posts = @album.posts.order(point: "DESC")
  end

  def all_index
    @albums = Album.all.order(name: :asc)
    @albums = @albums.page(params[:page]).per(50)
  end

  def search
    @albums = Album.where("name LIKE ?", "%#{params[:word]}%").or(Album.where("othername LIKE ?", "%#{params[:word]}%"))
    @albums = @albums.page(params[:page]).per(50)
    @word = params[:word]
  end

  def follow
    @follow = Follow.new(user_id: current_user.id, album_id: @album.id)
    @follow.save
  end

  def unfollow
    @follow = Follow.find_by(user_id: current_user.id, album_id: @album.id)
    @follow.destroy
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_album
    @album = Album.find(params[:id])
  end

  def albums_params
    params.require(:album).permit(:name, :othername, :tags, :apple, :spotify, :bandcamp, :wikipedia).merge(artist_id: params[:artist_id])
  end
end
