class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # we should broadcast the new message to whomever is listening
      # we have to give broadcast 2 things: where / what
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: 'message', locals: { message: @message })
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
