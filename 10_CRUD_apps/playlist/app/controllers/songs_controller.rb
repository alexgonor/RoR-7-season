class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_pararms)

    if @song.save
      redirect_to @song
    else
      render 'new'
    end
  end

  def update
    if @song.update(song_pararms)
      redirect_to @song
    else
      render 'edit'
    end
  end

  def destroy
    @song.destroy

    redirect_to songs_path
  end

  private

  def song_pararms
    params.require(:song).permit(:title, :author)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
