class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # tell everyone who is listening, HEY a new message has been created
      # ChatroomChannel.broadcast_to('to where?', 'what are you sending?')
      # instead of sending the content, we want to send the message HTML
      # ChatroomChannel.broadcast_to(@chatroom, @message.content)
      # send the html partial for the message we just created
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
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
