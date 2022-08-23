class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # Broadcast to everyone listening that a message was created
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: 'messages/message', locals: { message: @message })
      )
      # redirect_to chatroom_path(@chatroom)
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
