class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def new
    #goto logon form
  end

  def create
    #binding.pry
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      #redirect_to "/users/#{@user.id}"
      redirect_to "/songs"
    else
      puts 'Create Error'
      flash[:errorsLogin] = ["Invalid Email or PW"]
      # redirect_to :back
      redirect_to "/users/new"
    end

  end

  def destroy
    reset_session
    redirect_to "/users/new"
  end
end
