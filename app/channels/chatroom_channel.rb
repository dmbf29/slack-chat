class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # what station are we sending info to?
    chatroom = Chatroom.find(params[:id]) # 928 or general ...
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
