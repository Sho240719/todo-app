class Api::LikesController < Api::ApplicationController
  before_action :authenticate_user!

  def show
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    comment = task.comments.find(params[:comment_id])
    like_status = current_user.has_liked?(comment)
    render json: { hasLiked: like_status }
  end

  def create
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    comment = task.comments.find(params[:comment_id])
    comment.likes.create!(user_id: current_user.id)

    render json: { status: 'ok' }
  end

  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    comment = task.comments.find(params[:comment_id])
    like = comment.likes.find_by!(user_id: current_user.id)
    like.destroy!

    render json: { status: 'ok' }
  end
end
