class MessagesController < ApplicationController
  before_action :require_user

  def create
    #@message = current_user.messages.build(message_params)

    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)

  end

end
