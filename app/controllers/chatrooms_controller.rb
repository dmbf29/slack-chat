class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @message = Message.new
  end
end
