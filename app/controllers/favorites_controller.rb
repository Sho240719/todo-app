class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = current_user.favorite_comments
  end
end
