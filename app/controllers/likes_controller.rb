class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    comment = task.comments.find(params[:comment_id])
    comment.likes.create!(user_id: current_user.id)
    redirect_to board_task_path(board, task)
  end
end