class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # TODO: where does this id come from?
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
