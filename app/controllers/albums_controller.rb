class AlbumsController < ApplicationController
  before_action :set_artist
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required, only: [:edit, :update, :destroy]

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

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_album
    @artist = Album.find(params[:id])
  end

  def albums_params
    params.require(:album).permit(:name, :othername, :tags, :apple, :spotify, :bandcamp, :wikipedia).merge(artist_id: params[:artist_id])
  end
end
