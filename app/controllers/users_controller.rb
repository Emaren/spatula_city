class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).
          permit(:first_name, :last_name,
          :email, :password, :password_confirmation)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User Saved!"
    else
      render '/users/new', alert: "Not Saved!"
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to users_path,
      notice: "Deleted User!"
    else
      render 'index'
    end
  end





end
