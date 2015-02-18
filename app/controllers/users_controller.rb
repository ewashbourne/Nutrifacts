class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :redirect_if_signed_in, only: [:new, :create]
  before_action :admin_user,   only: [:destroy]

	
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to Nutrifacts!"
  		redirect_to user_path @user
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
  end

  # def index
  #   @users = User.all
  # end

private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
