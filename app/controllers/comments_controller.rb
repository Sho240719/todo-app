class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
    @comment = @task.comments.build(user: current_user)
  end
end