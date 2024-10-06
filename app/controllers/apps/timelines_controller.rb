class Apps::TimelinesController < Apps::ApplicationController
  def show
    user_ids = current_user.followings.pluck(:id)
    @boards = Board.where(user_id: user_ids)
  end
end