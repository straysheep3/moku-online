class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all.order("created_at DESC")
  end

  def show
    @chats = @room.chats.all.order("created_at DESC")
    @tasks = @room.tasks.all.order("created_at DESC")
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room
    else
      render "edit"
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

    def room_params
      params.require(:room).permit(:title, :description, :image)
    end

    def find_room
      @room = Room.find(params[:id])
    end

    def find_chat
      @chat = Chat.find(params[:room_id])
    end
end
