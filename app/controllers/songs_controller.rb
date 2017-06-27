class SongsController < ApplicationController

  def index
    puts 'In Show'
    @user = User.find(session[:user_id])
    @allSongs = Song.all;

  end

  def show
    @song = Song.find(params[:id])
    @allLikes = Like.all.where(song_id: params[:id])
  end

  def create
    #POST from form, does the create
    puts 'In Songs Create'
    #binding.pry
    @user =  User.find(session[:user_id])
    @song = Song.new(user_params)

    #binding.pry
    @song.count = 0;
    @song.user_id = session[:user_id];

    if @song.save
      #user created, have them logon now (or maybe log them in and go to show?)
      #session[:user_id] = @user.id
      redirect_to "/songs"
      #redirect_to "/sessions/new"
    else
      puts 'Create Error'
      flash[:errorsSong] = @song.errors.full_messages
      # redirect_to :back
      redirect_to "songs"
    end
  end

  private

    def user_params
      params.require(:song).permit(:title, :artist)
    end

end
