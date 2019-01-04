class AlbumsController < ApplicationController
  def create
    album = Album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      render json: album.errors.full_messages
    end
  end

  def new
    @album = Album.new
    @bands = Band.all
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    if album.update(album_params)
      redirect_to album_url(album)
    else
      render json: album.errors.full_messages
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to band_url(album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :studio_album)
  end
end