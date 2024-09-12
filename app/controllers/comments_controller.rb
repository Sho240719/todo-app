class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_board, only: [:new, :create]
  before_action :set_task, only: [:new, :create]

  def new
    @comment = @task.comments.build(user: current_user)
  end

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to board_task_path(@board, @task), notice: 'commentを追加しました'
    else
      flash.now[:error] = 'commentを追加できませんでした'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:task_id])
  end

end
