class LikesController < ApplicationController

    def create
      puts ('In Like Create')

      @song = Song.find(params[:song_id])
      @song.count = @song.count + 1
      @song.save

      @song_id = params[:song_id]
      @user_id = session[:user_id]
      #binding.pry
      @like = Like.all.where(user_id: @user_id, song_id: @song_id)
      if @like.empty?
        @like = Like.new(user_id:@user_id, song_id: params[:song_id], count: 1)
        @like.save
        #binding.pry
        redirect_to "/songs"
      else
         #binding.pry
         @theLikeObject = @like[0]
         @theLikeObject.count = @theLikeObject.count + 1
         #binding.pry
         @theLikeObject.save
         redirect_to "/songs"
      end

    end

end
