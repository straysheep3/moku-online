class TasksController < ApplicationController

  def new
    @room = Room.find(params[:room_id])

    @task = @room.tasks.create
  end

  def create
    @room = Room.find(params[:room_id])

    @task = @room.tasks.create(task_params)
    if @task.save
      redirect_to @room
    else
      render "new"
    end
  end

  private
    def task_params
      params.require(:task).permit(:content)
    end
end
