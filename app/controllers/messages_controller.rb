class MessagesController < ApplicationController

  def index
    set_room
    @messages = @room.messages

    respond_to do |format|
      format.html 
      format.js
      format.json { render(json: @messages) }
    end    #render(layout: false)
  end

  def create
    # POST /room/show.html.erb
    set_room
    #@message = Message.new(message_params.merge(room_id: @room.id)) same
    @message = @room.messages.build(message_params)
    if @message.save
      unless current_user
        session[:username] = @message.username
      end       #redirect_to(@room)
    end
    #else
      #flash[:error] = "Error:#{@message.errors.full_messages.to_sentence}"
      #redirect_to(room_path(@room))
    #end
    respond_to do |format|
      format.html do 
        if @message.persisted?
          redirect_to(@room)
        else
          flash[:error] = "Error:#{@room.errors.full_messages.to_sentence}"
          redirect_to(room_path)
        end
      end
      format.js
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:body, :username)
    end
end
