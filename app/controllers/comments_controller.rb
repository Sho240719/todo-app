class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
    @comment = @task.comments.build(user: current_user)
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
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
end
