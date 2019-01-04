class TracksController < ApplicationController
  def create
    track = Track.new(track_params)
    if track.save
      redirect_to album_url(track.album_id)
    else
      render json: track.errors.full_messages
    end
  end

  def new

  end

  def edit

  end

  def show

  end

  def update
    track = Track.find(params[:id])
    if track.update(track_params)
      redirect_to album_url(track.album_id)
    else
      render json: track.errors.full_messages
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to album_url(track.album_id)
  end

  private
  def track_params
    params.require(:track).permit(:title, :ord, :album_id, :bonus, :lyrics)
  end
end