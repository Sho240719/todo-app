class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_board, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update]

  def show
    @comment = Comment.find(1)
    @comments = @task.comments
  end

  def new
    @task = @board.tasks.build(user: current_user)
  end

  def create
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_path(@board), notice: '新たなTaskを追加しました'
    else
      flash.now[:error] = 'Taskを追加できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to board_path(@board), notice: '更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = @board.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(@board), notice: '削除しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :eyecatch)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:id])
  end

end
