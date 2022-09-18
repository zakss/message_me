class MessagesController < ApplicationController
  before_action :require_user

  def create
    #@message = current_user.messages.build(message_params)

    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      flash[:success] = "New message"
      redirect_to root_path
    else
      flash[:error] = "Error"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)

  end

end
