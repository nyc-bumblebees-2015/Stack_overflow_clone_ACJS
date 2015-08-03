class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to :root, notice: "You have successfully logged out."
  end


end
