class ChatroomController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params.require(:message).permit(:body, :user))
  end
end
