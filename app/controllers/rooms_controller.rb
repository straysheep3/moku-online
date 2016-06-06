class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all.order("created_at DESC")

  end

  def show
    #code
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render "new"
    end
  end

  def edit
    #code
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

  def room_params
    params.require(:room).permit(:title, :description)
  end

  def find_room
    @room = Room.find(params[:id])
  end
end
