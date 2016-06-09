class ChatsController < ApplicationController
  before_action :set_room
  before_action :set_chat, except: [:create]

  def new
    c_params = chat_params
    c_params[:user_id] = current_user.id
    @chat = @room.chats.create
  end


  def create
    c_params = chat_params
    c_params[:user_id] = current_user.id
    @chat = @room.chats.create(c_params)

    if @chat.save
      redirect_to @room
    else
      render "new"
    end
  end

  def update
    if @chat.update(chat_params)
      redirect_to @room
    else
      render "edit"
    end
  end

  def destroy
    @chat.destroy
    redirect_to room_path(@room)
  end

  private
    def chat_params
      params[:chat].permit(:comment, :user_id)
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_chat
      @chat = @room.chats.find(params[:id])
    end

    def room_params
      @room = Room.find(params[:room_id])
    end
end
