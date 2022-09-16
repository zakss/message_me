class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
  end

  def new
  end
end
