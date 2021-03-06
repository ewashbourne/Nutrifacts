class UsersController < ApplicationController
  before_action :signed_in_user,    only: [:edit, :update, :destroy]
  before_action :correct_user,      only: [:edit, :update, :destroy]
  before_action :redirect_if_signed_in, only: [:new, :create]
	
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to user_path @user
    else
      render 'edit'
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end



  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless current_user?(@user)
  end
end