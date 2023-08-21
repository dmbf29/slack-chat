class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # whenever you subscribe to the channel, you have to give the ID
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
