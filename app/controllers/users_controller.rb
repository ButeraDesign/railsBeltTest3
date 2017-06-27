class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_correct_user, only: [:edit, :show, :update, :destroy]

  def index
  end

  def new
    #shows form
  end

  def show
    puts 'In Show'
    @user = User.find(session[:user_id])
    #@allShoes = Shoe.all
    #@shoesForSale = Shoe.all.where(sold: false, seller_id: session[:user_id])
    #@shoesSold = Shoe.all.where(sold: true, seller_id: session[:user_id])
    #@shoesBought = Shoe.all.where(sold: true, buyer_id: session[:user_id])

    #binding.pry
  end

  def create
    #POST from form, does the create
    puts 'In Create'
    #binding.pry
    @user = User.new(user_params)
    #binding.pry

    if @user.save
      #user created, have them logon now (or maybe log them in and go to show?)
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
      #redirect_to "/sessions/new"
    else
      puts 'Create Error'
      flash[:errorsUser] = @user.errors.full_messages
      # redirect_to :back
      redirect_to "/users/new"
    end
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def require_correct_user
      if current_user != User.find(params[:id])
        redirect_to "/users/#{session[:user_id]}"
      end
    end

end
