class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      flash.now[:error] = user.errors.full_messages
      render :new
    end
   end

  def show
    @user = User.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(username: params[:username])
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
