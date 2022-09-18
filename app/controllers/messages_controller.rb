class MessagesController < ApplicationController
  before_action :logged_in_user
  
  def create
    message = current_user.build(message_params)
    if message.save
      redirect_to root_path
    else
      flash[:error] = "Erreur"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
