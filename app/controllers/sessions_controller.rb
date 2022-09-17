class SessionsController < ApplicationController


  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      flash[:notice] = "Logged in successfully "
      redirect_to root_path
    else
      flash.now[:alert] = "There was something wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:notice] = "Logged out"
    redirect_to login_path
  end

  def new
  end
end
