class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(user: current_user)
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_path(@board), notice: '新たなTaskを追加しました'
    else
      flash.now[:error] = 'Taskを追加できませんでした'
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline)
  end
end