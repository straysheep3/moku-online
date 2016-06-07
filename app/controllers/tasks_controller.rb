class TasksController < ApplicationController
  before_action :set_room
  before_action :set_task, except: [:create]

  def new
    @task = @room.tasks.create
  end

  def create
    @task = @room.tasks.create(task_params)
    if @task.save
      redirect_to @room
    else
      render "new"
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "タスクを削除しました。"
    else
      flash[:error] = "削除できませんでした。"
    end
    redirect_to @room
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @room, notice: "Todo item completed"
  end

  private
    def task_params
      params[:task].permit(:content)
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_task
      @task = @room.tasks.find(params[:id])
    end


    def room_params
      @room = Room.find(params[:room_id])
    end
end
