class Api::CommentsController < Api::ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_board, only: [:index, :new, :create]
  before_action :set_task, only: [:index, :new, :create]

  def index
    comments = @task.comments
    render json: comments
  end

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!

    render json: @comment
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
