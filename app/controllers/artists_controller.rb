class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  before_action :sign_in_required, only: [:edit, :update, :destroy]

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artists_params)
    if @artist.save
      redirect_to @artist, notice: "登録完了"
    else
      render "new"
    end
  end

  def index
    @artists = Artist.all.order(name: "ASC")
    @artists = @artists.page(params[:page]).per(50)
  end

  def show
    @albums = @artist.albums
    @posts = @artist.posts.order(point: "DESC")
  end

  def edit
  end

  def update
    if @artist.update(artists_params)
      redirect_to @artist, notice: "変更完了"
    else
      render "edit"
    end
  end

  def search
    @artists = Artist.where("name LIKE ?", "%#{params[:word]}%").or(Artist.where("othername LIKE ?", "%#{params[:word]}%"))
    @artists = @artists.page(params[:page]).per(50)
    @word = params[:word]
  end

  def follow
    @follow = Follow.new(user_id: current_user.id, artist_id: @artist.id)
    @follow.save
  end

  def unfollow
    @follow = Follow.find_by(user_id: current_user.id, artist_id: @artist.id)
    @follow.destroy
  end
  
  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artists_params
    params.require(:artist).permit(:name, :othername, :tags, :apple, :wikipedia, :spotify, :bandcamp)
  end
end
