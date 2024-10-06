class Apps::FavoritesController < Apps::ApplicationController
  def index
    @comments = current_user.favorite_comments
  end
end
