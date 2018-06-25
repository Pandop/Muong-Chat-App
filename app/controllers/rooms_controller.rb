class RoomsController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.all.order('created_at DESC')
    
  end
  
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create 
    @room = Room.new(room_params)
    if @room.save
      # Create message if needed
      #if params[:room][:message]
        #@room.messages.build(username: params[:room[:message][:username]])
      if message = @room.messages.first
        session[:username] = message.username
      end
      flash[:success] = "erro: Room was saved successfully."
      redirect_to(room_path(@room))
    else
      flash[:error] = "Error: #{@room.errors.full_messages.to_sentence}"
      redirect_to(root_path)
    end
  end

  private 
    def room_params 
      params.require(:room).permit(:name, messages_attributes:[:username, :body])
    end
end
