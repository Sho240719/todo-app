class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path, notice: "Taskを追加しました"
    else
      flash.now[:error] = "Taskを追加できませんでした"
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end

end