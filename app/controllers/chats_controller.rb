class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :edit, :update, :destroy]

  def new
    @room = Room.find(params[:room_id])
    @chat = @room.chats.create
    @user = current_user
  end


  def create
    @room = Room.find(params[:room_id])
    @user = current_user
    @chat = @room.chats.create(chat_params)
    if @chat.save
      redirect_to @room
    else
      render "new"
    end
  end

  def edit
    @room = Room.find(params[:room_id])
  end

  def update
    @room = Room.find(params[:room_id])
    if @chat.update(chat_params)
      redirect_to @room
    else
      render "edit"
    end

  end

  def destroy
    @chat.destroy
    @room = Room.find(params[:room_id])
    redirect_to room_path(@room)
  end

  private
    def chat_params
      params.require(:chat).permit(:comment, :user_id)
    end

    def find_chat
      @chat = Chat.find(params[:id])
    end
end
