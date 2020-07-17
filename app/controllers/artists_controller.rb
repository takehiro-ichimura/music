class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
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
    @artists = Artist.all
  end

  def show
    @albums = @artist.albums
    @posts = @artist.posts
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
  
  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artists_params
    params.require(:artist).permit(:name, :othername, :tags)
  end
end
